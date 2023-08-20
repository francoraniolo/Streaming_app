class Create
  prepend SimpleCommand
  include ActiveModel::Validations

  attr_reader :user, :purchase_option, :purchase

  EXPIRING_TIME = 2.days

  def initialize(user, purchase_option)
    @user = user
    @purchase_option = purchase_option
  end

  def call
    if user_can_purchase
      ActiveRecord::Base.transaction do
        create_purchase
        create_library_item
        return purchase
      end
    else
      errors.add(:base, :invalid_purchase)
    end
  end

  private

  def create_library_item
    @library_item = LibraryItem.create(user: user, product: purchase_option.product, purchase: purchase, expires_at: Time.current + EXPIRING_TIME)
  end

  def create_purchase
    @purchase = user.purchases.create(purchase_option: purchase_option)
  end

  def user_can_purchase
    !user.library_items.joins(:purchase)
    .where(library_items: { product: product })
    .where('purchases.expires_at >= ?', Time.current)
    .exists?
  end
end
