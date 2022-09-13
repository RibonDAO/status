module Discord
  class IncidentSender
    attr_reader :webhook, :url

    def initialize(webhook, url)
      @webhook = webhook
      @url     = url
    end

    def send(incident)
      client = webhook::Client.new(url:)

      client.execute do |builder|
        builder.content = I18n.t('we_had_an_incident')

        setup_embed(builder, incident)
      end
    end

    private

    def setup_embed(builder, incident)
      builder.add_embed do |embed|
        embed.title       = incident[:title]
        embed.description = incident[:description]
        embed.colour      = 0xFF0000 # red
        embed.timestamp   = Time.zone.now
        embed.url = 'https://status.ribon.io'
      end
    end
  end
end
