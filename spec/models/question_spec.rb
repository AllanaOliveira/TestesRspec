require 'rails_helper'
RSpec.describe Question, type: :model do
  let(:question) { FactoryBot.create :question }
  subject { question }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }

#     describe 'valid_description' do
#       it 'should be valid' do
#         question = FactoryBot.build :question
#         expect(question).to be_valid
#       end
#       it 'should be invalid' do
#         question = FactoryBot.build :question
#         expect(question).to be_valid
#       end
#     end
  end
  describe 'associations' do
    it { is_expected.to belong_to(:subject) }
  end
end