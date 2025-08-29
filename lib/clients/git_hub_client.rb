# frozen_string_literal: true

class GitHubClient
  def initialize(access_token)
    @client = Octokit::Client.new(access_token: access_token)
  end

  def create_gist(params)
    @client.create_gist(params)
  end
end
