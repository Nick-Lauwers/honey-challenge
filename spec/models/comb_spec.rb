require 'rails_helper'

RSpec.describe Comb, type: :model do
  
	# Validation tests
	it { should validate_presence_of(:pollen_glob_target) }
end
