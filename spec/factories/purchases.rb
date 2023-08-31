FactoryBot.define do
  factory :purchase do
    association :user
    association :purchase_option
  end
end
