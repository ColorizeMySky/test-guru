# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: [0, 1]) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sorted_names_by_category, ->(name) {
    joins(:category).where(categories: { name: name }).order(name: :desc).pluck(:name)
  }

  validates :name, presence: true
  validates :name, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
end
