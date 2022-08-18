module HealthCheckHelper
  def general_status(report)
    return failure_status if report.empty? || any_service_is_down?(report)

    success_status
  end

  def format_resource_name(name)
    return name.upcase if name == :api || name == 'api'

    name.capitalize
  end

  def format_resource_status(status)
    return I18n.t('operational') if status

    I18n.t('degraded')
  end

  def badge_data_for_severity_level(severity_level)
    case severity_level.to_sym
    when :minor
      { color: 'info', text: I18n.t('minor') }
    when :major
      { color: 'warning', text: I18n.t('major') }
    when :critical
      { color: 'danger', text: I18n.t('critical') }
    end
  end

  def badge_data_for_resolved_status(resolved_status)
    return { color: 'success', text: I18n.t('resolved') } if resolved_status

    { color: 'warning', text: I18n.t('unresolved') }
  end

  private

  def any_service_is_down?(report)
    report.to_s.include?('false')
  end

  def success_status
    {
      class_suffix: 'success',
      message: I18n.t('all_systems_operational')
    }
  end

  def failure_status
    {
      class_suffix: 'danger',
      message: I18n.t('one_or_more_services_degraded')
    }
  end
end
