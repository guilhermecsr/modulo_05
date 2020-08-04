# frozen_string_literal: true

RSpec.feature 'Gerenciando Site', type: :feature do
  criando_base_para_testes
  scenario 'Fazendo uma pesquisa', js: true do
    visit '/'
    fill_in('Search', with: question.description)
    find('#search').click
    sleep 1

    expect(page).to have_content "Resultados para o termo \"#{question.description}\"..."
    expect(page).to have_content subject.description
    expect(page).to have_content question.description
    expect(page).to have_content answer.description
  end
end
