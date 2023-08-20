class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option
  has_one :library_item
end
