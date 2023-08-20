class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def create
    user = User.find_by(params[:user_id])
    purchase_option = PurchaseOption.find(params[:purchase_option_id])
    command = Commands::Purchases::Create.call(user, purchase_option)

    if command.success?
     # render purchase
    else
      # render error message
    end
  end
end
