# Generates two combs, each with PollenGlob targets (i.e. SweetSpots) between 10.0 p/g and 15.0 p/g.
2.times do
	pollen_glob_target = rand(10.0..15.0).round(1)
	Comb.create!(pollen_glob_target: pollen_glob_target)
end

# Generates three WorkerBees
3.times do
	WorkerBee.create!()
end

# Computes PollenGlop productivity, Advisements, and Nectar consumption per WorkerBee in each Comb.
Comb.all.each { |comb| 
	WorkerBee.all.each { |worker_bee|

		pollen_glob_date = advisement_date = nectar_date = start_date = Time.now

		# Assuming all three WorkerBees will at some point be assigned to both Combs, we compute PollenGlob 
		# productivity per WorkerBee in each Comb; Measured weekly for two weeks.
		while pollen_glob_date <= start_date + 3.weeks

			pollen_glob_quantity = rand(5.0..17.9).round(1)

			worker_bee.pollen_globs.create!(quantity:   pollen_glob_quantity,
											comb:       comb,
											created_at: pollen_glob_date)

			pollen_glob_date += 1.week
		end

		# Assuming all three WorkerBees will at some point be assigned to both Combs, we issue Advisements for 
		# each WorkerBee in each Comb; Measured two to three times per week (i.e. once every three days) for two 
		# weeks.
		while advisement_date <= start_date + 3.weeks

			advisement = rand(200..20000).round(-2)

			worker_bee.advisements.create!(quantity:   advisement,
									   	   comb:       comb,
									   	   created_at: advisement_date)

			advisement_date += 2.weeks

			# Assuming all three WorkerBees will at some point be assigned to both Combs, we compute Nectar consumption 
			# per WorkerBee in each Comb; Nectar consumption can either be equal to the active Advisement, or to any
			# amount between 200 and 20,000 units; Measured two to three times per week (i.e. once every three days) for 
			# two weeks.
			while nectar_date <= advisement_date

				nectar_consumption = [advisement, rand(200..20000).round(-2)].sample

				worker_bee.nectars.create!(quantity:   nectar_consumption,
										   comb:       comb,
										   created_at: nectar_date)

				nectar_date += 3.days
			end
		end
	}
}