require 'rails_helper'

RSpec.describe Admin, type: :model do
  before { @admin = Admin.new(password: "Example User", email: "user@id.uff.br") }
  subject { @admin }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'lowcase_email' do
        it 'must be lowcase' do
          expect(@admin.email).to eq('user@id.uff.br')
        end
  end

  # describe 'correct_email' do
  #   it 'must be uffmail' do
  #     expect(admin.email).to eq(/[a-z]+@id.uff.br/)
  #   end
  # end

  #it {  should validate_uniqueness_of(:email).case_insensitive }
  #   describe 'valid_password' do
  #     it 'must be at least 8 characters' do
  #       admin = Admin.new(email: email, password: password).save
  #       expect(admin).to be(false)
  #     end
  #   end
  #
  #   describe 'valid_email' do
  #     it 'must be uffmail' do
  #       admin = Admin.new(email: email, password: password).save
  #       expect(admin).to be(true)
  #     end
  #   end
  # end
  # describe 'password field' do
  #   subject { Admin.new(email: 'teste@id.uff.br', password: password).valid? }
  #   context 'when password has wrong format' do
  #     let(:password) { nil }
  #     it 'complains for invalid format' do
  #       is_expected.to eq false
  #     end
  #   end
  #
  #   context 'when password size is incorrect' do
  #     let(:password) { 'abc' }
  #     it 'complains for invalid format' do
  #       is_expected.to eq false
  #     end
  #   end
  #
  #   context 'when password has correct format' do
  #     let(:password) { '12345678' }
  #     it 'accepts valid format' do
  #       is_expected.to eq true
  #     end
  #   end
  # end
end