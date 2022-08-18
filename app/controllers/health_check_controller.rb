class HealthCheckController < ApplicationController
  def index
    @incidents = Incident.last(10).reverse

    @report = Rails.cache.fetch('report', expires_in: 15.minutes) do
      HealthCheckReport.new(*PROVIDERS).generate
    end
  end
end
