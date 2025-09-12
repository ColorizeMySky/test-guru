# frozen_string_literal: true

class AwardBadgeService
  def self.call(test_passage)
    user = test_passage.user
    test = test_passage.test
    score = test_passage.total_score

    Badge.find_each do |badge|
      next if user.badges.include?(badge)

      rule_type = badge.rule_type
      value = badge.value

      UserBadge.create!(user: user, badge: badge) if BadgeRule.applies_to?(user, test, score, rule_type, value)
    end
  end
end
