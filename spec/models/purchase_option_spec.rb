require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  describe 'Associations' do
    it { should belong_to(:purchasable) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:video_quality) }
  end
end
