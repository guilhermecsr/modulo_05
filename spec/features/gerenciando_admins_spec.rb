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

  scenario 'Resgistrando um subject', js: true do
    visit '/admins/sign_in'
    logando_com_admin
    visit '/admins_backoffice/subjects'
    visit '/admins_backoffice/subjects/new'
    fill_in('subject_description', with: 'Subject Test')
    click_button 'Salvar'

    expect(page).to have_current_path('/admins_backoffice/subjects')
    expect(page).to have_content 'Backoffice Administrativo'
    expect(page).to have_content 'Subject Test'
  end

  scenario 'Editando um subject', js: true do
    visit '/admins/sign_in'
    logando_com_admin
    visit '/admins_backoffice/subjects'
    visit "/admins_backoffice/subjects/#{subject.id}/edit"
    fill_in('subject_description', with: 'Subject Test')
    click_button 'Salvar'

    expect(page).to have_current_path('/admins_backoffice/subjects')
    expect(page).to_not have_content subject.description
    expect(page).to have_content 'Backoffice Administrativo'
    expect(page).to have_content 'Subject Test'
  end

  # scenario 'Deletando um subject', js: true do
  #   visit '/admins/sign_in'
  #   logando_com_admin
  #   visit '/admins_backoffice/subjects'
  #   visit "/admins_backoffice/subjects/#{subject.id}"
  #   # fill_in('subject_description', with: 'Subject Test')
  #   # click_button 'Salvar'
  #
  #   # expect(page).to have_current_path('/admins_backoffice/subjects')
  #   # expect(page).to_not have_content subject.description
  #   expect(page).to have_content 'Backoffice Administrativo'
  #   # expect(page).to have_content 'Subject Test'
  #   binding.pry
  # end
end
