require 'rails_helper'
RSpec.describe Subject, type: :model do
  let(:subject) {FactoryBot.create :subject }

  describe 'validations' do
    it {is_expected.to validate_presence_of(:description)}
  end

  describe 'associations' do
    it { is_expected.to have_many(:questions) }
  end

end