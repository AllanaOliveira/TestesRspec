require 'rails_helper'
RSpec.describe Answer, type: :model do
  let(:answer) { FactoryBot.create :answer }
  subject { answer }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end
  describe 'associations' do
    it { is_expected.to belong_to(:question) }
  end
end