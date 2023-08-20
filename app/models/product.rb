class Product < ApplicationRecord
  has_many :purchase_options
  has_many :library_items
end
