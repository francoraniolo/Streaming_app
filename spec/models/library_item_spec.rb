require 'rails_helper'

RSpec.describe LibraryItem, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:product) }
    it { should belong_to(:purchase) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:expires_at) }
  end
end
