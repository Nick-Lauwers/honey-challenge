FactoryBot.define do
  factory :advisement do
    quantity { 1 }
    is_overruled? { false }
  end
end
