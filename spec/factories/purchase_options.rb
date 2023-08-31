FactoryBot.define do
  factory :purchase_option do
    price { 2.99 }
    video_quality { 'SD' }
    association :purchasable, factory: :movie
  end
end
