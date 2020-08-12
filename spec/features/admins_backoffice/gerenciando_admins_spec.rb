# frozen_string_literal: true

RSpec.feature 'Gerenciando admins', type: :feature do
  criando_base_para_testes
  scenario 'Resgistrando um subject', js: true do
    visit '/admins/sign_in'
    logando_com_admin
    visit '/admin'
    find('#menu').click
    find('.fa-file-text').click
    find('.fa-plus').click
    fill_in('subject_description', with: 'Subject Test')
    click_button 'Salvar'

    expect(page).to have_current_path('/admins_backoffice/subjects')
    expect(page).to have_content 'Backoffice Administrativo'
    expect(page).to have_content 'Subject Test'
  end

  scenario 'Editando um subject', js: true do
    visit '/admins/sign_in'
    logando_com_admin
    visit '/admin'
    find('#menu').click
    find('.fa-file-text').click
    within "#subjects" do
      find('.fa-edit').click
    end
    fill_in('subject_description', with: 'Subject Test')
    click_button 'Salvar'

    expect(page).to have_current_path('/admins_backoffice/subjects')
    expect(page).to_not have_content subject.description
    expect(page).to have_content 'Backoffice Administrativo'
    expect(page).to have_content 'Subject Test'
  end

  scenario 'Deletando um subject', js: true do
    visit '/admins/sign_in'
    logando_com_admin
    visit '/admin'
    find('#menu').click
    find('.fa-file-text').click
    within "#subjects" do
      find('.fa-minus').click
    end
    page.driver.browser.switch_to.alert.accept
    binding.pry
    expect(page).to have_content 'Backoffice Administrativo'
    expect(page).to have_content 'Subject Test'
  end
end
