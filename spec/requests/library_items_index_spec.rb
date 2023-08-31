require 'rails_helper'

RSpec.describe LibraryItemsController, type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let!(:library_item1) { create(:library_item, user:, expires_at: 1.day.from_now) }
    let!(:library_item2) { create(:library_item, user:, expires_at: 2.days.from_now) }
    let!(:library_item3) { create(:library_item, user:, expires_at: Time.current - 1.day) }

    before do
      get library_items_path(user_id: user.id)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the user library items that are not expired' do
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['id']).to eq(library_item1.id)
      expect(json_response[1]['id']).to eq(library_item2.id)
    end
  end
end
