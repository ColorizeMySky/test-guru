# frozen_string_literal: true

class BadgeRules::PassedOnRegistrationDayRule
  def applies?(user, _, _)
    Date.current.month == user.created_at.month && Date.current.day == user.created_at.day
  end
end
