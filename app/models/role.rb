class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  ADMIN = 'Администратор'.freeze
  TEACHER = 'Преподаватель (автор тестов)'.freeze
  STUDENT = 'Ученик (тестируемый)'.freeze
end
