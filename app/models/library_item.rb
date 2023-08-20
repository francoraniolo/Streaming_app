class LibraryItem < ApplicationRecord
  belongs_to :user
  belongs_to :product, polymorphic: true
  belongs_to :purchase
end
