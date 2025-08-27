# frozen_string_literal: true

module FlashHelper
  def flash_messages
    flash.to_hash
  end
end
