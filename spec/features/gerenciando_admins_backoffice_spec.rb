# frozen_string_literal: true

RSpec.feature 'Gerenciando usuários', type: :feature do
  criando_base_para_testes
  scenario 'Logando um Adm', js: true do
    visit '/admins/sign_in'
    sleep 1
    fill_in('admin_email', with: admin.email)
    sleep 1
    fill_in('admin_password', with: admin.password)
    sleep 1
    click_button 'Log in'

    # o devise esta redirecionando para o root, nao deveria, mas se devesse estatia certo
    expect(page).to have_current_path('/')
    expect(page).to_not have_content 'Backoffice'
    expect(page).to have_content 'Time to Answer'
    expect(page).to have_content 'Últimas questões cadastradas...'
  end
end
