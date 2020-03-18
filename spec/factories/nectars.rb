FactoryBot.define do
  factory :nectar do
    quantity { rand(200..20000).round(-2) }
    comb_id { nil }
    worker_bee_id { nil }
  end
end
