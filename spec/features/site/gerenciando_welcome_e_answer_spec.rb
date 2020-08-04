# frozen_string_literal: true

RSpec.feature 'Gerenciando Site', type: :feature do
  criando_base_para_testes
  scenario 'Acessando a home', js: true do
    visit '/'
    sleep 1
    expect(page).to have_content subject.description
    expect(page).to have_content question.description
    expect(page).to have_content answer.description
  end
end
