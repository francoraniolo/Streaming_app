class User < ApplicationRecord
  has_many :purchases
  has_many :library_items
end
