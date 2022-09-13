require 'rails_helper'

RSpec.describe Incident, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:severity_level) }
  end

  describe 'after_create' do
    subject(:incident) { create(:incident) }

    let(:entrypoint) { instance_double(Discord::Entrypoint) }

    before do
      allow(Discord::Entrypoint).to receive(:new).and_return(entrypoint)
      allow(entrypoint).to receive(:run)
    end

    it 'sends an incident to Discord' do
      incident

      expect(entrypoint).to have_received(:run)
    end
  end
end
