require 'rails_helper'

RSpec.describe Discord::IncidentSender do
  describe '#send' do
    subject(:incident_call) { described_class.new(webhook, url).send(incident) }

    let(:webhook) { Discordrb::Webhooks }
    let(:url) { 'https://discordapp.com/api/webhooks/12345/abcd' }
    let(:incident) { { title:, description: } }
    let(:title) { 'Test incident' }
    let(:description) { 'This is a test incident' }
    let(:client) { instance_double(Discordrb::Webhooks::Client) }

    before do
      allow(Discordrb::Webhooks::Client).to receive(:new).and_return(client)
      allow(client).to receive(:execute)
    end

    it 'sends an incident to Discord' do
      incident_call

      expect(client).to have_received(:execute)
    end
  end
end
