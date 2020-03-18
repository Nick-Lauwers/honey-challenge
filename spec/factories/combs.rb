FactoryBot.define do
  factory :comb do
    pollen_glob_target { rand(10.0..15.0).round(1) }
  end
end
