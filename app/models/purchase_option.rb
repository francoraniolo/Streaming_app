class PurchaseOption < ApplicationRecord
  belongs_to :product, polymorphic: true

  enum video_quality: { SD: 0, HD: 1 }
end
