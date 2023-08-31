require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'Associations' do
    it { should have_many(:purchase_options) }
    it { should have_many(:library_items) }
    it { should have_many(:episodes) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:plot) }
    it { should validate_presence_of(:number) }
  end
end
