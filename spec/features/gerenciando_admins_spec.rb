require 'rails_helper'
RSpec.feature 'Gerenciando administradores', type: :feature do
  before do
    allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
  end

  let!(:admin) { FactoryBot.create :admin }

  scenario 'Criando um admin', js: true do
    visit admins_backoffice_admins_path
    click_link(id: 'new')
    sleep 1
    fill_in('Email', with: 'ariane@id.uff.br')
    sleep 1
    fill_in('Senha', with: '123456')
    fill_in('Confirmação da Senha', with: '123456')
    sleep 1
    click_button 'Salvar'
    expect(page).to have_content "Administrador cadastrado com sucesso"
    sleep(1)
  end

  scenario 'Criando um admin mensagem de erro', js: true do
    visit admins_backoffice_admins_path
    click_link(id: 'new')
    sleep 1
    fill_in('Email', with: 'admin56@bla.uff.br')
    sleep 1
    fill_in('Senha', with: 'blabla')
    fill_in('Confirmação da Senha', with: 'blbla')
    sleep 1
    click_button 'Salvar'
    expect(page).to have_no_content "Administrador cadastrado com sucesso"
    #expect(page).to have_content 'Email não é válido!'
    sleep(1)
  end

  scenario 'Atualizando um admin', js: true do
    visit admins_backoffice_admins_path
    click_link(id: 'edit')
    sleep(1)
    fill_in('Email', with: admin.email)
    sleep(1)
    fill_in('Senha', with: 'ariane.123456')
    fill_in('Confirmação da Senha', with: 'ariane.123456')
    sleep(1)
    click_button 'Salvar'
    expect(page).to have_content "Administrador atualizado com sucesso!"
    sleep(1)
  end

  scenario 'Atualizando um admin com erro', js: true do
    visit admins_backoffice_admins_path
    click_link(id: 'edit')
    sleep(1)
    fill_in('Email', with: 'allana@ic.uff.br')
    sleep(1)
    fill_in('Senha', with: 'ariane.123456')
    fill_in('Confirmação da Senha', with: 'ariane.123456')
    sleep(1)
    click_button 'Salvar'
    expect(page).to have_no_content "Administrador atualizado com sucesso!"
    sleep(1)
  end

  scenario 'Excluindo um admin', js: true do
    visit admins_backoffice_admins_path(admin)
    accept_alert do
      click_link(id: 'delete')
    end
    #text = page.driver.browser.switch_to.alert.text
    #expect(text).to eq "Deseja realmente excluir #{admin.email.truncate(15)}?"
    expect(page).to have_content "Administrador excluido com sucesso!"
    sleep(1)
  end

end