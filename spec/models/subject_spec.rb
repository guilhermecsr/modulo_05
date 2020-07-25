RSpec.describe Subject, type: :model do
  describe 'associations' do
    let(:subject) { FactoryBot.create :subject }
    # subject { subject }
    it { expect(subject).to have_many(:questions) }
  end
end
