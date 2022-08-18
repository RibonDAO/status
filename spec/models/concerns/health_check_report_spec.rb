require 'rails_helper'

RSpec.describe HealthCheckReport, type: :model do
  describe '#generate' do
    subject(:report_call) { report.generate }

    let(:report) { described_class.new(*providers) }
    let(:providers) { [provider, another_provider] }
    let(:provider) do
      OpenStruct.new({ get: { name: 'Core API', url: 'http://url.ribon.io/',
                              statuses: { api: true, redis: true, database: true } } })
    end

    let(:another_provider) do
      OpenStruct.new({ get: { name: 'Interface', url: 'http://link.ribon.io/', statuses: { application: true } } })
    end

    let(:expected_result) do
      [
        {
          name: 'Core API',
          url: 'http://url.ribon.io/',
          statuses: { api: true, redis: true, database: true }
        },
        {
          name: 'Interface',
          url: 'http://link.ribon.io/',
          statuses: { application: true }
        }
      ]
    end

    it 'returns the expected result' do
      expect(report_call).to eq(expected_result)
    end
  end
end
