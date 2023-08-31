require 'rails_helper'

RSpec.describe PurchasesController, type: :request do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:purchase_option) { create(:purchase_option) }

    context 'when successful' do
      before do
        post purchases_path(user_id: user.id, purchase_option_id: purchase_option.id)
      end

      it 'creates a purchase and renders the purchased product' do
        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response['id']).to eq purchase_option.purchasable.id
        expect(json_response['title']).to eq purchase_option.purchasable.title
        expect(json_response['plot']).to eq purchase_option.purchasable.plot
      end
    end

    context 'when unsuccessful' do
      let!(:library_item) { create(:library_item, user: user, product: purchase_option.purchasable, expires_at: 2.days.from_now) }

      before do
        post purchases_path(user_id: user.id, purchase_option_id: purchase_option.id)
      end

      it 'renders an error message with unprocessable_entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('You already owns this product')
      end
    end
  end
end
