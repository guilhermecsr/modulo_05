RSpec.describe Question, type: :model do
  describe 'associations' do
    let(:subject) { FactoryBot.create :subject }
    let(:question) { FactoryBot.create :question, subject_id: subject.id }
    let!(:answer) { FactoryBot.create :answer, question: question }

    # subject { question }

    it { expect(question).to belong_to(:subject) }
    it { expect(question).to have_many(:answers) }
  end
end