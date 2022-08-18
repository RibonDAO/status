# frozen_string_literal: true

class CoreApiProvider < BaseProvider
  APP = 'Core API'
  URL = 'http://ribon-core-api-staging.us-east-1.elasticbeanstalk.com/health'

  def self.get
    get_endpoint_status(APP, URL)
  end
end
