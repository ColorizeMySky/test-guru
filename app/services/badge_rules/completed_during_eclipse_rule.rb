# frozen_string_literal: true

class BadgeRules::CompletedDuringEclipseRule
  ECLIPSE_DATES = [
    Date.parse('2025-09-12'),
    Date.parse('2026-08-12'),
    Date.parse('2027-08-02'),
    Date.parse('2028-07-22'),
    Date.parse('2029-07-11'),
    Date.parse('2030-06-01'),
    Date.parse('2030-11-25')
  ].freeze

  def applies?(*)
    ECLIPSE_DATES.include?(Date.current)
  end
end
