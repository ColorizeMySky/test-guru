# frozen_string_literal: true

class GistQuestionService
  attr_reader :result

  def initialize(question, test_passage, client = default_client)
    @question = question
    @test = @question.test
    @test_passage = test_passage
    @client = client
  end

  def call
    github_result = @client.create_gist(gist_params)

    if github_result&.html_url
      @result = GistResult.new(github_result.html_url, true)
      save_gist!(github_result)
    else
      @result = GistResult.new(nil, false)
    end
  rescue Octokit::Error
    @result = GistResult.new(nil, false)
  ensure
    @result
  end

  private

  def default_client
    token = ENV.fetch('GITHUB_ACCESS_TOKEN')
    GitHubClient.new(token)
  end

  def gist_params
    {
      description: I18n.t('gist_question_service.gist_description', test_name: @test.name),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.text, *@question.answers.pluck(:body)].join("\n")
  end

  def save_gist!(result)
    Gist.create!(
      question: @question,
      user: @test_passage.user,
      url: result.html_url
    )
  end
end
