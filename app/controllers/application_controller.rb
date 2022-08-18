class ApplicationController < ActionController::Base
  PROVIDERS = [
    CoreApiProvider,
    InterfaceProvider
  ].freeze
end
