class WorkerBee < ApplicationRecord
	has_many :pollen_globs
	has_many :combs, through: :pollen_globs
end
