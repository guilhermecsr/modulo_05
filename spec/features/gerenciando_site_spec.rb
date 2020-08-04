# frozen_string_literal: true

RSpec.feature 'Gerenciando Site', type: :feature do
  criando_base_para_testes
  scenario 'Acessando a home layout', js: true do
    visit '/'
    sleep 1
    expect(page).to_not have_content 'Backoffice'
    expect(page).to have_content 'Time to Answer'
    expect(page).to have_content 'Últimas questões cadastradas...'
  end
end
