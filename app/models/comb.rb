class Comb < ApplicationRecord

	has_many :pollen_globs
	has_many :worker_bees, -> { distinct }, through: :pollen_globs

	has_many :nectars
	has_many :worker_bees, -> { distinct }, through: :nectars

	has_many :advisements
	has_many :worker_bees, -> { distinct }, through: :advisements

	validates_presence_of :pollen_glob_target
end
