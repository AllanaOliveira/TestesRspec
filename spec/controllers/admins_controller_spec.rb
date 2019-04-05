require "rails_helper"

RSpec.describe AdminsBackoffice::AdminsController , type: :controller do
  #admin = login_admin
  #let!(:admin){ admin}
  before do
    allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
  end

  let(:admin) { FactoryBot.create :admin }
  subject { admin }

  describe "GET #index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    context 'when password is invalid' do
      it 'renders the page with error' do

        post :create, params: { admin: {email: admin.email, password: admin.password, password_confirmation: '96578456'}}

        expect(response).to render_template(:new)
        expect(flash.now[:alert]).to eq("Não foi possível criar administrador")
        end
      end
      context 'when password is valid' do
        it 'sets the user in the session and redirects them to their dashboard' do
          post :create, params: { admin: {email: admin.email, password: admin.password, password_confirmation: admin.password_confirmation}}
          redirect_to admins_backoffice_admins_path
          #expect(flash[:notice]).to eq("Administrador cadastrado com sucesso")

        end
      end
    end


  describe '#update' do
     context  do
       before do
         put :update, params: {id: admin.id, admin: { email: admin.email, password: '123456789', password_confirmation: '123456789' }}
       end

       it 'assigns the person' do
         expect(assigns(:admin)).to eq(admin)
       end
       it 'returns http redirect' do
         expect(response).to have_http_status(:redirect)
         expect(response).to redirect_to admins_backoffice_admins_path
       end
       it "should update the person" do
         admin.reload
       end
     end
  end

  describe "DELETE #destroy" do
    context 'when admin is delete' do
      it "destroys the requested select_option" do
          delete :destroy, params: { id: admin.id }
      end

      it "redirects to the field" do
        delete :destroy, params: { id: admin.id }
        expect(response).to redirect_to admins_backoffice_admins_path
      end
    end
  end
end



RSpec.describe Admin, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'admins_backoffice/admins').to route_to('admins_backoffice/admins#index')
    end

    it 'routes to #show' do
      expect(get: 'admins_backoffice/admins/1').to route_to('admins_backoffice/admins#show', id: '1')
    end

    it 'routes to #new' do
      expect(get: 'admins_backoffice/admins/new').to route_to('admins_backoffice/admins#new')
    end

    it 'routes to #update via PUT' do
      expect(put: 'admins_backoffice/admins/1').to route_to('admins_backoffice/admins#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'admins_backoffice/admins/1').to route_to('admins_backoffice/admins#update', id: '1')
    end
  end
end