class PollenGlob < ApplicationRecord

  	belongs_to :comb
  	belongs_to :worker_bee

  	validates_presence_of :quantity
end
