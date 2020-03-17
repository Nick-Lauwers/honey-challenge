require 'rails_helper'

RSpec.describe WorkerBee, type: :model do

	# Relationship tests
    it { should have_many(:combs).through(:pollen_globs) }
end
