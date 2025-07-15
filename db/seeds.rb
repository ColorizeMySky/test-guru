# Создание пользователей
user1 = User.create!(email: 'user1@example.com', password: 'password1')
user2 = User.create!(email: 'user2@example.com', password: 'password2')

# Создание категорий
category1 = Category.create!(name: 'Бэкенд')
category2 = Category.create!(name: 'Фронтенд')

# Создание тестов
test1 = Test.create!(name: 'Основы Ruby', level: 1, category: category1, author: user1)
test2 = Test.create!(name: 'Основы HTML', level: 1, category: category2, author: user2)

# Создание вопросов
question1 = Question.create!(text: 'Что такое Ruby?', score: 5, test: test1)
question2 = Question.create!(text: 'Что такое HTML?', score: 5, test: test2)

# Создание ответов
Answer.create!(answer_text: 'Язык программирования', is_correct: true, question: question1)
Answer.create!(answer_text: 'Язык разметки', is_correct: true, question: question2)
