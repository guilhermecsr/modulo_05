RSpec.describe Answer, type: :model do
  describe 'associations' do
    let(:subject) { FactoryBot.create :subject }
    let(:question) { FactoryBot.create :question, subject: subject }
    let(:answer) { FactoryBot.create :answer, question: question }

    it { expect(answer).to belong_to(:question) }
  end

  describe 'validations' do
    let(:answer) { FactoryBot.build :answer, question: nil }

    it { expect(answer.save).to be_falsey }
  end
end