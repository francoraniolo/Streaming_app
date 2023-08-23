class PurchaseOption < ApplicationRecord
  belongs_to :purchasable, polymorphic: true

  enum video_quality: { SD: 0, HD: 1 }
end
