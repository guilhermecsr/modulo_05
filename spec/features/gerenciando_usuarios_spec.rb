# frozen_string_literal: true

# spec/features/gerenciando_usuarios_spec.rb
RSpec.feature 'Gerenciando usuários', type: :feature, order: :defined do
  criando_base_para_testes
  scenario 'Criando um usuário' do
    visit '/users/sign_up'
    sleep 1
    # click_link 'Cadastrar-se'
    sleep 1
    fill_in('user_email', with: 'guiuser@user.com')
    sleep 1
    fill_in('user_password', with: '123456')
    sleep 1
    fill_in('user_password_confirmation', with: '123456')
    sleep 1
    click_button 'Criar Cadastro'
    sleep 1
    expect(page).to have_current_path('/')
  end

  scenario 'Logando um usuário inexistente' do
    # visit '/usuarios'
    visit users_backoffice_welcome_index_path
    expect(page).to have_current_path('/users/sign_in')
  end

  scenario 'Logando um usuário existente', js: true do
    visit('/users/sign_in')
    sleep 1
    fill_in('user_email', with: user.email)
    sleep 1
    fill_in('user_password', with: user.password)
    sleep 1
    click_button 'Log in'

    expect(page).to have_current_path('/')
    expect(page).to_not have_content 'Cadastrar-se'
    expect(page).to have_content 'Backoffice'
  end

  scenario 'Respondendo uma questao errada', js: true do
    visit('/users/sign_in')
    logando_com_user
    visit('/')
    choose(answer.description)
    click_button 'Responder'

    expect(page).to have_current_path('/site/answer')
    expect(page).to_not have_content 'Acertou!'
    expect(page).to have_content 'Errow!'
  end
end
