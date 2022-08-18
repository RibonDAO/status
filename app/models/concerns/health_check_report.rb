class HealthCheckReport
  attr_reader :providers

  def initialize(*providers)
    @providers = providers
  end

  def generate
    providers.map(&:get)
  end
end
