class WorkerBeesController < ApplicationController
  include WorkerBees::AcceptanceCalculator

  def show

    worker_bee = WorkerBee.find(params[:id])
    comb       = Comb.find(params[:comb_id])

    @measurements = calculate_perc_accepted(worker_bee, comb)

    generate_gon_variables(@measurements)
  end

  private

    # Using the gon gem, we prepare a PollenGlobs dataset and a Nectar dataset 
    # for the Highcharts graph; The datasets will take the following form:
    # gon.pollen_globs = [ [date01, pollen_glob01],
    #                      [date02, pollen_glob02] ]
    def generate_gon_variables(measurements)

      gon.pollen_globs, gon.nectars = [ ], [ ]

      measurements.each { |measurement| 

        gon.pollen_globs << ( measurement[:pollen_globs] ? [ seconds_since_epoch(measurement[:date]), measurement[:pollen_globs].to_f ] : 
                                                           [ seconds_since_epoch(measurement[:date]), "null" ] )
				
        gon.nectars      << [ (measurement[:date].strftime('%s').to_f * 1000).to_i, measurement[:nectar] ]
      }
    end

    # Returns the seconds since epoch of a datetime; This format is required by 
    # Highcharts.
    def seconds_since_epoch(datetime)
      (datetime.strftime('%s').to_f * 1000).to_i
    end
end
