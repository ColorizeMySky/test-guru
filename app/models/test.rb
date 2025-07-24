# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.sorted_names_by_category(category_name)
    joins(:category)
      .where(categories: { name: category_name })
      .order(name: :desc)
      .pluck(:name)
  end
end
