class Comb < ApplicationRecord

	has_many :pollen_globs
	has_many :nectars
	has_many :advisements

	# We can map Combs to WorkerBees using a "has_many, through" relationship. Combs
	# can be mapped to WorkerBees through PollenGlobs, Nectars, or Advisements. In
	# this case, we have chosen PollenGlobs. Mapping through Nectars and Advisments as
	# well is unnecessary, as the relationship will only return duplicates. Additionally, 
	# we use the "distinct" method to remove any duplicates of the 
	# "Comb -> PollenGlob -> WorkerBee" relationship.
	has_many :worker_bees, -> { distinct }, through: :pollen_globs

	validates_presence_of :pollen_glob_target
end
