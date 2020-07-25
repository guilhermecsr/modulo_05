RSpec.describe Answer, type: :model do
  describe 'associations' do
    let(:subject) { FactoryBot.create :subject }
    let(:question) { FactoryBot.create :question, subject: subject }
    let(:answer) { FactoryBot.create :answer, question: question }
    # subject { answer }
    it { expect(answer).to belong_to(:question) }
  end
end