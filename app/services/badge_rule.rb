# frozen_string_literal: true

require 'prime'

class BadgeRule
  def self.applies_to?(user, test, score, rule_type, value)
    new(rule_type, value).applies_to?(user, test, score)
  end

  attr_reader :rule_type, :value

  def initialize(rule_type, value)
    @rule_type = rule_type
    @value = value
  end

  def applies_to?(user, test, score)
    return false unless rule_type.present?

    method = rule_methods[rule_type]
    return false unless method

    send(method, user, test, score)
  end

  private

  def rule_methods
    {
      'passed_on_registration_day' => :passed_on_registration_day?,
      'test_name_contains_awesome' => :test_name_contains_awesome?,
      'same_score_as_user_id' => :same_score_as_user_id?,
      'test_passed_on_friday_13th' => :test_passed_on_friday_13th?,
      'completed_test_during_eclipse' => :completed_during_eclipse?,
      'scored_prime_number_of_points' => :scored_prime_number_of_points?,
      'answered_all_questions_wrong' => :answered_all_questions_wrong?
    }
  end

  def passed_on_registration_day?(_, _, _)
    Date.today.month == user.created_at.month && Date.today.day == user.created_at.day
  end

  def test_name_contains_awesome?(test, _, _)
    test.name&.downcase&.include?('awesome')
  end

  def same_score_as_user_id?(user, _, score)
    score == user.id
  end

  def test_passed_on_friday_13th?(_, _, _)
    Date.current.friday? && Date.current.day == 13
  end

  def scored_prime_number_of_points?(_, _, score)
    ::Prime.prime?(score)
  end

  def answered_all_questions_wrong?(_, _, score)
    score.zero?
  end

  def completed_during_eclipse?(_, _, _)
    eclipse_dates = [
      Date.parse('2025-09-12'),
      Date.parse('2026-08-12'),
      Date.parse('2027-08-02'),
      Date.parse('2028-07-22'),
      Date.parse('2029-07-11'),
      Date.parse('2030-06-01'),
      Date.parse('2030-11-25')
    ]
    eclipse_dates.include?(Date.current)
  end
end
