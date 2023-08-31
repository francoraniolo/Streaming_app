require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:purchase_option) }
  end
end
