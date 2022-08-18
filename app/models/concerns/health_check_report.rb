class HealthCheckReport
  attr_reader :providers

  def initialize(*providers)
    @providers = providers
  end

  def generate
    providers.map do |provider|
      result = provider.get
    end
  end
end