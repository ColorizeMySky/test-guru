# frozen_string_literal: true

module FlashHelper
  def render_flash
    safe_join(
      flash.map do |type, message|
        next if type == 'timedout'
        content_tag :div, message, class: "alert alert-#{flash_class(type)} alert-dismissible fade show", role: 'alert'
      end.compact,
      ' '.html_safe
    )
  end

  private

  def flash_class(type)
    case type
    when 'notice' then 'success'
    when 'alert' then 'danger'
    when 'warning' then 'warning'
    when 'info'    then 'info'
    else 'secondary'
    end
  end
end
