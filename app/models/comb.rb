class Comb < ApplicationRecord
	has_many :pollen_globs
	has_many :worker_bees, through: :pollen_globs
end
