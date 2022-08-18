# frozen_string_literal: true

class InterfaceProvider < BaseProvider
  APP = 'Interface'
  URL = 'https://dapp.ribon.io'

  def self.get
    get_endpoint_status(APP, URL)
  end
end
