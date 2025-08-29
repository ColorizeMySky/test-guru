class GistQuestionService
  def initialize(question, test_passage, client: nil)
    @question = question
    @test = @question.test
    @test_passage = test_passage
    @client = client || GitHubClient.new(ENV['GITHUB_ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def call
    result = @client.create_gist(gist_params)

    if result
      @gist_url = result.html_url
      Gist.create!(
        question: @question,
        user: @test_passage.user,
        url: @gist_url
      )
    end

    result
  rescue Octokit::Error
    nil
  end

  def success?
    @gist_url.present?
  end

  def gist_url
    @gist_url
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
      description: "A question about #{@test.name} from TestGuru",
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

end
