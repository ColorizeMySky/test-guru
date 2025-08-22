# frozen_string_literal: true

module FlashHelper
  def flash_messages
    flash.map do |type, message|
      content_tag :div, message, class: "flash flash_#{type}"
    end.join.html_safe
  end
end
