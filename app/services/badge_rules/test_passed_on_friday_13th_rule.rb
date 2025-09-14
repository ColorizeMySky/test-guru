# frozen_string_literal: true

class BadgeRules::TestPassedOnFriday13thRule
  def applies?(*)
    Date.current.friday? && Date.current.day == 13
  end
end
