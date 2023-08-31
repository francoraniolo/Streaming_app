require 'rails_helper'

RSpec.describe CreatePurchase, type: :command do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:purchase_option) { create(:purchase_option, purchasable: movie) }

  subject(:command) { described_class.call(user, purchase_option) }

  describe '.call' do
    context 'when user can make a purchase' do
      it 'creates a purchase and a library item' do
        expect(command).to be_success
        expect(command.result).to be_an_instance_of(Purchase)
        expect(user.library_items.count).to eq(1)
      end
    end

    context 'when user cannot make a purchase' do
      let!(:library_item) { create(:library_item, user: user, product: movie, expires_at: 2.days.from_now) }

      it 'adds an error to the command' do
        expect(command).to be_failure
        expect(command.errors[:base]).to include('You already owns this product')
      end
    end
  end
end
