class PurchaseOption < ApplicationRecord
  belongs_to :purchasable, polymorphic: true

  validates :price, :video_quality, presence: true

  enum video_quality: { SD: 0, HD: 1 }
end
