require 'rails_helper'

RSpec.describe HealthCheckHelper, type: :helper do
  describe "#general_status" do
    subject { helper.general_status(report) }

    context "when the report is empty" do
      let(:report) { {} }
      let(:expected_result) do
        {
          class_suffix: 'danger',
          message: I18n.t('one_or_more_services_degraded')
        }
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end

    context "when the report is not empty" do
      let(:report) { {'api' => true, 'database' => true} }
      let(:expected_result) do
        {
          class_suffix: 'success',
          message: I18n.t('all_systems_operational')
        }
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
  end

  describe "#format_resource_name" do
    subject { helper.format_resource_name(name) }

    context "when the name is 'api'" do
      let(:name) { 'api' }
      let(:expected_result) { 'API' }

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
    context "when the name is 'database'" do
      let(:name) { 'database' }
      let(:expected_result) { 'Database' }

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end

    context "when the name is 'application'" do
      let(:name) { 'application' }
      let(:expected_result) { 'Application' }

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
  end

  describe "#format_resource_status" do
    subject { helper.format_resource_status(status) }

    context "when the status is true" do
      let(:status) { true }
      let(:expected_result) { I18n.t('operational') }

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end

    context "when the status is false" do
      let(:status) { false }
      let(:expected_result) { I18n.t('degraded') }

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
  end

  describe "#badge_data_for_severity_level" do
    subject { helper.badge_data_for_severity_level(severity_level) }

    context "when the severity level is 'minor'" do
      let(:severity_level) { 'minor' }
      let(:expected_result) do
        { color: 'info', text: I18n.t('minor') }
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
    context "when the severity level is 'major'" do
      let(:severity_level) { 'major' }
      let(:expected_result) do
        { color: 'warning', text: I18n.t('major') }
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
    context "when the severity level is 'critical'" do
      let(:severity_level) { 'critical' }
      let(:expected_result) do
        { color: 'danger', text: I18n.t('critical') }
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
  end

  describe "#badge_data_for_resolved_status" do
    subject { helper.badge_data_for_resolved_status(resolved_status) }

    context "when the resolved status is true" do
      let(:resolved_status) { true }
      let(:expected_result) { { color: 'success', text: I18n.t('resolved') } }

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end

    context "when the resolved status is false" do
      let(:resolved_status) { false }
      let(:expected_result) { { color: 'warning', text: I18n.t('unresolved') } }

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
  end
end
