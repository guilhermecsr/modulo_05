RSpec.feature 'Gerenciando Site', type: :feature do
  # let!(:admin) { FactoryBot.create :admin }
  scenario 'Acessando a home', js: true do
    visit '/'
    sleep 1
    expect(page).to_not have_content 'Backoffice'
    expect(page).to have_content 'Time to Answer'
    expect(page).to have_content 'Últimas questões cadastradas...'
  end
end
