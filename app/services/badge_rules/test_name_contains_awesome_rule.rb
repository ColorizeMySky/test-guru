# frozen_string_literal: true

class BadgeRules::TestNameContainsAwesomeRule
  def applies?(_, test, _)
    test.name&.downcase&.include?('awesome')
  end
end
