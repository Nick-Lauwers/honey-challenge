FactoryBot.define do
  factory :pollen_glob do
    quantity { rand(5.0..17.9).round(1) }
    comb_id { nil }
    worker_bee_id { nil }
  end
end
