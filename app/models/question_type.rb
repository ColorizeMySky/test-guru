class QuestionType < ApplicationRecord
  has_many :questions

  SINGLE_CHOICE = 'Одиночный выбор'.freeze
  MULTIPLE_CHOICE = 'Множественный выбор'.freeze
  OPEN_ANSWER = 'Открытый ответ'.freeze
end
