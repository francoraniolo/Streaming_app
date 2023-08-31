class Season < ApplicationRecord
  has_many :purchase_options, as: :purchasable
  has_many :library_items, as: :product
  has_many :episodes

  validates :number, :title, :plot, presence: true

  def self.cache_key
    maximum(:updated_at).to_s
  end
end
