Answer.delete_all
Question.delete_all
Result.delete_all
Test.delete_all
Category.delete_all
User.delete_all

user1 = User.create!(email: 'alice@example.com', password: 'securepass')
user2 = User.create!(email: 'bob@example.com', password: '12345678')

category1 = Category.create!(name: 'Бэкенд')
category2 = Category.create!(name: 'Фронтенд')

test1 = Test.create!(name: 'Основы Ruby', level: 1, category: category1, author: user1)
test2 = Test.create!(name: 'Основы HTML', level: 1, category: category2, author: user2)

q1 = Question.create!(text: 'Что такое переменная в Ruby?', score: 5, test: test1)
Answer.create!(answer_text: 'Именованное хранилище данных', is_correct: true, question: q1)
Answer.create!(answer_text: 'Тип данных', is_correct: false, question: q1)
Answer.create!(answer_text: 'Метод', is_correct: false, question: q1)
Answer.create!(answer_text: 'Класс', is_correct: false, question: q1)

q2 = Question.create!(text: 'Как объявить массив в Ruby?', score: 5, test: test1)
Answer.create!(answer_text: 'array = [1, 2, 3]', is_correct: true, question: q2)
Answer.create!(answer_text: 'array := (1, 2, 3)', is_correct: false, question: q2)
Answer.create!(answer_text: 'array <- 1, 2, 3', is_correct: false, question: q2)
Answer.create!(answer_text: 'array = {1; 2; 3}', is_correct: false, question: q2)

q3 = Question.create!(text: 'Что делает метод puts в Ruby?', score: 5, test: test1)
Answer.create!(answer_text: 'Выводит строку в консоль', is_correct: true, question: q3)
Answer.create!(answer_text: 'Сохраняет данные в файл', is_correct: false, question: q3)
Answer.create!(answer_text: 'Создаёт переменную', is_correct: false, question: q3)
Answer.create!(answer_text: 'Удаляет объект', is_correct: false, question: q3)

q4 = Question.create!(text: 'Что делает тег <p> в HTML?', score: 5, test: test2)
Answer.create!(answer_text: 'Создаёт абзац текста', is_correct: true, question: q4)
Answer.create!(answer_text: 'Добавляет картинку', is_correct: false, question: q4)
Answer.create!(answer_text: 'Формирует таблицу', is_correct: false, question: q4)
Answer.create!(answer_text: 'Выделяет заголовок', is_correct: false, question: q4)

q5 = Question.create!(text: 'Как вставить ссылку в HTML?', score: 5, test: test2)
Answer.create!(answer_text: '<a href="...">Текст</a>', is_correct: true, question: q5)
Answer.create!(answer_text: '<link src="...">', is_correct: false, question: q5)
Answer.create!(answer_text: '<url>...</url>', is_correct: false, question: q5)
Answer.create!(answer_text: '<ref="...">Ссылка</ref>', is_correct: false, question: q5)

q6 = Question.create!(text: 'Для чего используется тег <img>?', score: 5, test: test2)
Answer.create!(answer_text: 'Для вставки изображения', is_correct: true, question: q6)
Answer.create!(answer_text: 'Для оформления текста', is_correct: false, question: q6)
Answer.create!(answer_text: 'Для создания формы', is_correct: false, question: q6)
Answer.create!(answer_text: 'Для подключения скриптов', is_correct: false, question: q6)

Result.create!(user_id: user1, test: test1)
Result.create!(user_id: user1, test: test2)
Result.create!(user_id: user2, test: test1)
Result.create!(user_id: user2, test: test2)
Result.create!(user_id: user1, test: test1)
Result.create!(user_id: user2, test: test2)
Result.create!(user_id: user1, test: test2)
