# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests, dependent: :restrict_with_error

  scope :ordered_by_name, -> { order(name: :asc) }

  validates :name, presence: true
end
