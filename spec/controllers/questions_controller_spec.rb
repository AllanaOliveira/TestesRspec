require "rails_helper"

RSpec.describe AdminsBackoffice::QuestionsController , type: :controller do

  before do
    allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
  end

  let(:question) { FactoryBot.create :question }
  subject { question }

  describe "GET #index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do

    context  do
      it 'Criaaa' do
        post :create, params: {question: { description: question.description, subject: question.subject.description}}
        redirect_to admins_backoffice_questions_path
        #expect(notice).to eq( "Questão cadastrada com sucesso!")

      end
    end
  end

  describe '#update' do
    novo = Faker::Lorem.characters(160)
    context 'OK'  do
      before do
        put :update, params: {id: question.id, question: { description: question.description, subject: question.subject.description}}
      end

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to admins_backoffice_questions_path
      end
      it "should update the person" do
        question.reload
      end
    end
    context 'descrição maior do que válida'  do
      before do
        put :update, params: {id: question.id, question: { description: novo, subject: question.subject.description}}
      end
      it 'redireciona' do
      expect(response).to render_template(:edit)
      expect(flash.now[:notice]).to eq("Não foi possível editar questão")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      delete :destroy, params: { id: question.id }
    end

    it "redirects to the field" do
      delete :destroy, params: { id: question.id }
      expect(response).to redirect_to admins_backoffice_questions_path
    end
  end
end