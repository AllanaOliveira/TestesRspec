# describe 'POST #create' do
#   let(:admin) { Admin.create :admin }
#   context 'when password is invalid' do
#     it 'renders the page with error' do
#       post :create, params: { email: admin.email, password: 'invalid' }
#       expect(response).to render_template(:new)
#       #expect(flash[:notice]).to eq(Email and password do not match)
#       #end

#     end
#     context 'when password is valid' do
#       it 'sets the admin in the session and redirects them to their dashboard' do
#         post :create, params: { email: admin.email, password: admin.password }
#         expect(response).to redirect_to '/dashboard'
#         #expect(controller.current_admin).to eq admin
#       end
#     end
#   end
# end
module ControllerAdmins
  def login_admin
    admin = FactoryBot.create(:admin)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in admin
    end
    admin
  end
end

