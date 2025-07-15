class Test < ApplicationRecord
  def self.sorted_names_by_category(category_name)
    joins(:category)
      .where(categories: { name: category_name })
      .order(name: :desc)
      .pluck(:name)
  end
end
