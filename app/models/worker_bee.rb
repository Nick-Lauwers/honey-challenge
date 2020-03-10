class WorkerBee < ApplicationRecord

	has_many :pollen_globs
	has_many :combs, -> { distinct }, through: :pollen_globs

	has_many :nectars
	has_many :combs, -> { distinct }, through: :nectars

	has_many :advisements
	has_many :combs, -> { distinct }, through: :advisements
end
