FactoryBot.define do
  factory :library_item do
    association :user
    association :product, factory: :movie
    association :purchase
    expires_at { 2.days.from_now }
  end
end
