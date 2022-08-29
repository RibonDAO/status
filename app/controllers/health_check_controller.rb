class HealthCheckController < ApplicationController
  include HealthCheckHelper

  def index
    @incidents = Incident.last(10).reverse

    @report = Rails.cache.fetch('report', expires_in: 15.minutes) do
      HealthCheckReport.new(*PROVIDERS).generate
    end

    @general_status = general_status(@report)
  end
end
