# frozen_string_literal: true

class BaseProvider
  ACCEPTABLE_TIMEOUT = 20

  def self.get_endpoint_status(name, url)
    response = fetch(url)

    {
      name:,
      url: sanitize_url(url),
      statuses: sanitize_statuses(response).symbolize_keys
    }
  end

  def self.sanitize_url(url)
    URI.join(url, '/').to_s
  end

  def self.sanitize_statuses(response)
    if valid_json?(response.body)
      JSON.parse(response.body)
    else
      {
        application: response.code == 200
      }
    end
  end

  def self.fetch(url)
    RestClient::Request.execute(
      method: :get,
      url:,
      timeout: ACCEPTABLE_TIMEOUT
    )
  rescue StandardError
    OpenStruct.new({
                     code: 500,
                     body: { application: false }.to_json
                   })
  end

  def self.valid_json?(json)
    JSON.parse(json)
    true
  rescue StandardError
    false
  end
end
