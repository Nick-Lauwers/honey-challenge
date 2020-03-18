FactoryBot.define do
  factory :advisement do
    quantity { rand(200..20000).round(-2) }
    is_overruled { false }
    comb_id { nil }
    worker_bee_id { nil }
  end
end
