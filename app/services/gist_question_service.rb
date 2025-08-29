# frozen_string_literal: true

class GistQuestionService
  attr_reader :gist_url

  def initialize(question, test_passage, client: nil)
    @question = question
    @test = @question.test
    @test_passage = test_passage
    @client = client || GitHubClient.new(ENV['GITHUB_ACCESS_TOKEN'])
  end

  def call
    result = @client.create_gist(gist_params)

    if result
      @gist_url = result.html_url
      save_gist(result)
    end

    result
  rescue Octokit::Error
    nil
  end

  def success?
    @gist_url.present?
  end

  def flash_message
    if success?
      I18n.t('gist_question_service.success', test_name: @test.name)
    else
      I18n.t('gist_question_service.failure')
    end
  end

  private

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
    content = [@question.text]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def save_gist(result)
    Gist.create!(
      question: @question,
      user: @test_passage.user,
      url: result.html_url
    )
  end
end
