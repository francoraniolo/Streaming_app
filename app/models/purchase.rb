class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  delegate :purchasable, to: :purchase_option
end
