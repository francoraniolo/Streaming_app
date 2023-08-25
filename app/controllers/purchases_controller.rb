class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    purchase_option = PurchaseOption.find(params[:purchase_option_id])
    command = Commands::Purchases::Create.call(user, purchase_option)

    if command.success?
      render json: command.result, serializer: ProductSerializer
    else
      # render error message
      render json: { error: command.error_message }, status: :unprocessable_entity
    end
  end
end
