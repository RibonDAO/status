require 'rails_helper'

RSpec.describe BaseProvider, type: :service do
  describe "#get_endpoint_status" do
    subject { BaseProvider.get_endpoint_status(name, url) }

    context "when the endpoint is up" do
      let(:name) { "Core API" }
      let(:url) { "http://url.ribon.io/health" }
      let(:response) { OpenStruct.new({code: 200, body: {api: true, database: true}.to_json}) }
      let(:expected_result) do
        {
          name: "Core API",
          url: "http://url.ribon.io/",
          statuses: {api: true, database: true}
        }
      end

      before do
        allow(RestClient::Request).to receive(:execute).and_return(response)
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end

    context "when the endpoint is down" do
      let(:name) { "Core API" }
      let(:url) { "http://url.ribon.io/health" }
      let(:response) { OpenStruct.new({code: 500, body: {application: false}.to_json}) }
      let(:expected_result) do
        {
          name: "Core API",
          url: "http://url.ribon.io/",
          statuses: {application: false}
        }
      end
      before do
        allow(RestClient::Request).to receive(:execute).and_return(response)
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end

    context "when the endpoint is up but the response is not valid JSON" do
      let(:name) { "Core API" }
      let(:url) { "http://url.ribon.io/health" }
      let(:response) { OpenStruct.new({code: 200, body: "not valid JSON"}) }
      let(:expected_result) do
        {
          name: "Core API",
          url: "http://url.ribon.io/",
          statuses: {application: true}
        }
      end
      before do
        allow(RestClient::Request).to receive(:execute).and_return(response)
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end

    context "when the endpoint is down and the response is not valid JSON" do
      let(:name) { "Core API" }
      let(:url) { "http://url.ribon.io/health" }
      let(:response) { OpenStruct.new({code: 500, body: "not valid JSON"}) }
      let(:expected_result) do
        {
          name: "Core API",
          url: "http://url.ribon.io/",
          statuses: {application: false}
        }
      end
      before do
        allow(RestClient::Request).to receive(:execute).and_return(response)
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end

    context "when the restclient request fails" do
      let(:name) { "Core API" }
      let(:url) { "http://url.ribon.io/health" }
      let(:response) { OpenStruct.new({code: 500, body: "not valid JSON"}) }
      let(:expected_result) do
        {
          name: "Core API",
          url: "http://url.ribon.io/",
          statuses: {application: false}
        }
      end
      before do
        allow(RestClient::Request).to receive(:execute).and_raise(RestClient::Exception)
      end

      it "returns the expected result" do
        expect(subject).to eq(expected_result)
      end
    end
  end
end
