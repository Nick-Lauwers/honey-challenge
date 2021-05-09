require 'rails_helper'

RSpec.describe Advisement, type: :model do

  # Relationship tests
  it { should belong_to(:worker_bee) }
  it { should belong_to(:comb) }

  # Validation tests
  it { should validate_presence_of(:quantity) }
end
