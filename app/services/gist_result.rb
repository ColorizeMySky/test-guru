# frozen_string_literal: true

class GistResult
  attr_reader :url, :success

  def initialize(url, success)
    @url = url
    @success = success
  end

  def success?
    @success
  end
end
