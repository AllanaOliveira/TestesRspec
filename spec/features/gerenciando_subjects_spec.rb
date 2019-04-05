require 'rails_helper'
RSpec.feature 'Gerenciando assuntos', type: :feature do
  before do
    allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
  end

  let!(:subject){ FactoryBot.create :subject }


  scenario 'Criando um assunto', js: true do
    visit admins_backoffice_subjects_path
    click_link(id: 'new')
    sleep 1
    fill_in(id:"subject_description", with: subject.description)
    sleep 1
    click_button 'Salvar'
    expect(page).to have_content "Assunto/Área cadastrado com sucesso"
    sleep(1)
  end

  scenario 'Atualizando um assunto', js: true do
    visit admins_backoffice_subjects_path
    click_link(id: 'edit')
    sleep 1
    fill_in(id:"subject_description", with: "Vamos nessa!")
    sleep 1
    click_button 'Salvar'
    expect(page).to have_content "Assunto/Área atualizado com sucesso!"
    sleep(1)
  end

  scenario "Excluindo um assunto", js: true do
    visit admins_backoffice_subjects_path
    accept_alert do
      click_link(id: 'delete')
    end

    expect(page).to have_content "Assunto/Área excluido com sucesso!"
  end
end