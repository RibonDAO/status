module Discord
  class Entrypoint
    attr_reader :incident

    WEBHOOK_BASE_URL = 'https://discordapp.com/api/webhooks/'.freeze

    def initialize(title, description)
      @incident = { title:, description: }
    end

    def run
      webhooks.each do |wehbook|
        IncidentSender.new(Discordrb::Webhooks, "#{WEBHOOK_BASE_URL}#{wehbook}").send(incident)
      end
    end

    private

    def webhooks
      return ENV['INCIDENT_WEBHOOKS'].split(', ') if ENV['INCIDENT_WEBHOOKS'].present?

      []
    end
  end
end
