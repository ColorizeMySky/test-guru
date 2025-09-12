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

    case rule_type
    when 'passed_on_registration_day'
      Date.today.month == user.created_at.month && Date.today.day == user.created_at.day
    when 'test_name_contains_awesome'
      test.name&.downcase&.include?('awesome')
    when 'same_score_as_user_id'
      score == user.id
    when 'test_passed_on_friday_13th'
      Date.current.friday? && Date.current.day == 13
    when 'completed_test_during_eclipse'
      completed_during_eclipse?
    when 'scored_prime_number_of_points'
      ::Prime.prime?(score)
    when 'answered_all_questions_wrong'
      score == 0
    else
      false
    end
  end

  private

  def completed_during_eclipse?
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

  def present?(value)
    !value.nil? && !value.respond_to?(:empty?) || !value.empty?
  end
end
