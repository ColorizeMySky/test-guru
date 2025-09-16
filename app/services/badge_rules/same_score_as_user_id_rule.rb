# frozen_string_literal: true

class BadgeRules::SameScoreAsUserIdRule
  def applies?(user, _, score)
    score == user.id
  end
end
