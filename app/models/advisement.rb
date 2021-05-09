class Advisement < ApplicationRecord

    belongs_to :comb
    belongs_to :worker_bee

    validates_presence_of :quantity
    validates_inclusion_of :is_overruled, :in => [true, false]
end
