require 'rails_helper'

RSpec.describe Discord::Entrypoint do
  describe '#run' do
    subject(:entrypoint_call) { described_class.new(title, description).run }

    let(:title) { 'Test incident' }
    let(:description) { 'This is a test incident' }
    let(:incident) { { title:, description: } }
    let(:client) { instance_double(Discordrb::Webhooks::Client) }

    before do
      allow(Discordrb::Webhooks::Client).to receive(:new).and_return(client)
      allow(client).to receive(:execute)
    end

    context 'when we have just one wehbook' do
      let(:webhooks) { ['12345/abcd'] }

      before do
        stub_const('ENV', { 'INCIDENT_WEBHOOKS' => webhooks.join(', ') })
      end

      it 'sends an incident to all webhooks' do
        entrypoint_call

        expect(client).to have_received(:execute).exactly(webhooks.size).times
      end
    end

    context 'when we have more than one wehbook' do
      let(:webhooks) { ['12345/abcd', '67890/defg'] }

      before do
        stub_const('ENV', { 'INCIDENT_WEBHOOKS' => webhooks.join(', ') })
      end

      it 'sends an incident to all webhooks' do
        entrypoint_call

        expect(client).to have_received(:execute).exactly(webhooks.size).times
      end
    end

    context 'when we do not have any webhook' do
      let(:webhooks) { [] }

      before do
        stub_const('ENV', { 'INCIDENT_WEBHOOKS' => webhooks.join(', ') })
      end

      it 'sends an incident to all webhooks' do
        entrypoint_call

        expect(client).to have_received(:execute).exactly(webhooks.size).times
      end
    end
  end
end
