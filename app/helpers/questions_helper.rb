# frozen_string_literal: true

module QuestionsHelper
  def question_header(test)
    action = question.new_record? ? 'Create New' : 'Edit'
    "#{action} #{test.name} Question"
  end
end
