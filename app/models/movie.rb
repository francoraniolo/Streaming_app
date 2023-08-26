class Movie < ApplicationRecord
  has_many :purchase_options, as: :purchasable
  has_many :library_items, as: :product

  def self.cache_key
    maximum(:updated_at).to_s
  end
end
