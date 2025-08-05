module QuestionsHelper
  def question_header(test)
    action = action_name == 'new' ? 'Create New' : 'Edit'
    "#{action} #{test.name} Question"
  end
end
