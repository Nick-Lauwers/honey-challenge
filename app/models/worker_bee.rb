class WorkerBee < ApplicationRecord

	has_many :pollen_globs
	has_many :nectars
	has_many :advisements

	# We can map WorkerBees to Combs using a "has_many, through" relationship. WorkerBees
	# can be mapped to Combs through PollenGlobs, Nectars, or Advisements. In
	# this case, we have chosen PollenGlobs. Mapping through Nectars and Advisments as
	# well is unnecessary, as the relationship will only return duplicates. Additionally, 
	# we use the "distinct" method to remove any duplicates of the 
	# "WorkerBee -> PollenGlob -> Comb" relationship.
	has_many :combs, -> { distinct }, through: :pollen_globs
end
