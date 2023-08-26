class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def create
    purchase_option = PurchaseOption.find(params[:purchase_option_id])
    command = CreatePurchase.call(user, purchase_option)

    if command.success?
      render json: command.result.purchasable, serializer: ProductSerializer
    else
      # render error message
      render json: { error: command.error_message }, status: :unprocessable_entity
    end
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def purchase_option
    @purchase_option ||= PurchaseOption.find(params[:purchase_option_id])
  end
end
