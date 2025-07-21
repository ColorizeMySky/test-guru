# frozen_string_literal: true

class Test < ApplicationRecord
  def self.sorted_names_by_category(category_name)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.name = ?', category_name)
      .order(name: :desc)
      .pluck(:name)
  end
end
