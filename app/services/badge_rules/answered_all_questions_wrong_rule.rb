# frozen_string_literal: true

class BadgeRules::AnsweredAllQuestionsWrongRule
  def applies?(_, _, score)
    score.zero?
  end
end
