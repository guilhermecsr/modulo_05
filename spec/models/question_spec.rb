RSpec.describe Question, type: :model do
  describe 'associations' do
    let(:question) { FactoryBot.find :question }
    # subject { question }

    it { is_expected.to belong_to(:subject) }
    it { is_expected.to have_many(:answers) }
  end
end