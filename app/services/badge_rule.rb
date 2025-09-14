# frozen_string_literal: true

require 'prime'

class BadgeRule
  RULE_TYPES = {
    'passed_on_registration_day' => BadgeRules::PassedOnRegistrationDayRule,
    'test_name_contains_awesome' => BadgeRules::TestNameContainsAwesomeRule,
    'same_score_as_user_id' => BadgeRules::SameScoreAsUserIdRule,
    'test_passed_on_friday_13th' => BadgeRules::TestPassedOnFriday13thRule,
    'completed_test_during_eclipse' => BadgeRules::CompletedDuringEclipseRule,
    'scored_prime_number_of_points' => BadgeRules::ScoredPrimeNumberOfPointsRule,
    'answered_all_questions_wrong' => BadgeRules::AnsweredAllQuestionsWrongRule
  }.freeze

  def self.applies_to?(user, test, score, rule_type, value)
    rule_class = RULE_TYPES[rule_type]
    return false unless rule_class

    rule_class.new.applies?(user, test, score)
  end
end
