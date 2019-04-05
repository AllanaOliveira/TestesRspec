require 'rails_helper'
RSpec.feature 'Gerenciando questões', type: :feature do
  before do
    allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
  end

  let!(:question){ FactoryBot.create :question }
  subject {question}

  scenario 'visualizando questions na lista', js: true do
    visit admins_backoffice_subjects_path
    expect(page).to have_content question.subject.description
  end

  scenario 'Criando uma questão', js: true do
    visit admins_backoffice_questions_path
    click_link(id: 'new')
    sleep 1
    fill_in(id:"question_description", with: question.description)
    sleep 1
    #select(id:"question_subject_id", from: question.subject.description)
    #sleep 1
    click_button 'Salvar'
    expect(page).to have_content "Questão cadastrada com sucesso!"
    sleep(1)
  end

  scenario 'Atualizando uma questão', js: true do
    visit admins_backoffice_questions_path
    click_link(id: 'edit')
    sleep 1
    fill_in(id:"question_description", with: question.description)
    sleep 1
    #select(id:"question_subject_id", from: question.subject.description)
    #sleep 1
    click_button 'Salvar'
    expect(page).to have_content "Questão atualizada com sucesso!"
    sleep(1)
  end

  scenario 'Excluindo uma questão', js: true do
    visit admins_backoffice_questions_path(question)
    accept_alert do
      click_link(id: 'delete')
    end
    #text = page.driver.browser.switch_to.alert.text
    #expect(text).to eq "Deseja realmente excluir #{admin.email.truncate(15)}?"
    expect(page).to have_content "Questão excluída com sucesso!"
    sleep(1)
  end
end