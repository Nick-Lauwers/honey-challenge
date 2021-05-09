module WorkerBees
  module AcceptanceCalculator
    extend ActiveSupport::Concern

    def calculate_perc_accepted(worker_bee, comb)

      measurements = generate_table(worker_bee, comb)

      # Set the number of accepted advisements, the number of total advisements, 
      # and the default advisement amount to 0.
      accepted_advisements, total_advisements, advisement = 0, 0, 0

      measurements.each { |measurement| 

        if measurement[:advisement]
          advisement = measurement[:advisement] 
          accepted_advisements = total_advisements = 0
        end

        if advisement == measurement[:nectar]
          accepted_advisements += 1
        end

        total_advisements += 1

        perc_accepted = ( (accepted_advisements.to_f / total_advisements) * 100 ).round()
        measurement[:perc_accepted] = perc_accepted
      }

      measurements
    end

    private

      # Since PollenGlob production, Nectar consumption, and Advisements are 
      # contained in separate DB tables, we should combine them into a single 
      # data structure before presenting them on the WorkerBee page; We will 
      # combine them into an Array of hashes of the form:
      # measurements = [ { date: "a", pollen_globs: "b", nectar: "c", 
      #                    advisement: "d", perc_accepted: "e" }, 
      #                  { date: "f", pollen_globs: "g", nectar: "h", 
      #                    advisement: "i", perc_accepted: "j"}, ...]	
      def generate_table(worker_bee, comb)

        measurements = [ ]

        pollen_globs = PollenGlob.where(worker_bee: worker_bee, comb: comb)
        nectar       = Nectar.where(worker_bee: worker_bee, comb: comb)
        advisements  = Advisement.where(worker_bee: worker_bee, comb: comb)

        # Fill measurements array with PollenGlob amounts.
        pollen_globs.each { |pollen_glob|
          measurements << { date:          pollen_glob.created_at,
                            pollen_globs:  pollen_glob.quantity,
                            nectar:        0,
                            advisement:    nil,
                            perc_accepted: nil }
        }

        # Fill measurements array with Nectar amounts.
        nectar.each { |nectar|

          do_next = false

          measurements.each { |measurement| 
            if measurement[:date].to_date == nectar.created_at.to_date
              measurement[:nectar] = nectar.quantity
              do_next = true
              break
            end
          }

          next if do_next

          measurements << { date:          nectar.created_at,
                            pollen_globs:  nil,
                            nectar:        nectar.quantity,
                            advisement:    nil,
                            perc_accepted: nil }
        }

        # Fill measurements array with Advisement amounts.
        advisements.each { |advisement|

          do_next = false

          measurements.each { |measurement| 
            if measurement[:date].to_date == advisement.created_at.to_date
              measurement[:advisement] = advisement.quantity
              do_next = true
              break
              end
          }

          next if do_next

          measurements << { date:          advisement.created_at,
                            pollen_globs:  nil,
                            nectar:        nil,
                            advisement:    advisement.quantity,
                            perc_accepted: nil }
        }

        # Sort measurements in order of increasing date.
        measurements.sort_by! { |measurement| measurement[:date] }
      end
  end
end