class Movie < ApplicationRecord
  has_many :purchase_options, as: :purchasable
  has_many :library_items, as: :product
end
