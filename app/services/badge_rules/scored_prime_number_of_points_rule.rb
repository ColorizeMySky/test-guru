# frozen_string_literal: true

class BadgeRules::ScoredPrimeNumberOfPointsRule
  def applies?(_, _, score)
    ::Prime.prime?(score)
  end
end
