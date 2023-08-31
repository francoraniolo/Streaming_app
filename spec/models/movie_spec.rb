require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Associations' do
    it { should have_many(:purchase_options) }
    it { should have_many(:library_items) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:plot) }
  end
end
