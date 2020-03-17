require 'rails_helper'

RSpec.describe Comb, type: :model do
    
    # Relationship tests
    it { should have_many(:worker_bees).through(:pollen_globs) }

	# Validation tests
	it { should validate_presence_of(:pollen_glob_target) }
end
