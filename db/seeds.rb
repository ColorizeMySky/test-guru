Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
User.delete_all

user1 = User.create!(email: 'alice@example.com', password: 'securepass', first_name: 'Alice', last_name: 'Smith', type: 'User')
user2 = User.create!(email: 'bob@example.com', password: '12345678', first_name: 'Bob', last_name: 'Johnson', type: 'User')
user3 = Admin.create!(email: 'demo@demo.com', password: '12345qq', first_name: 'Admin', last_name: 'Demo')

category1 = Category.create!(name: 'Бэкенд')
category2 = Category.create!(name: 'Фронтенд')

test1 = Test.create!(name: 'Основы Ruby', level: 1, category: category1, author: user3)
test2 = Test.create!(name: 'Основы HTML', level: 1, category: category2, author: user3)
test3 = Test.create!(name: 'Абсурдный JavaScript', level: 2, category: category1, author: user3)
test4 = Test.create!(name: 'Невероятный CSS', level: 3, category: category2, author: user3)

q1 = Question.create!(
  text: 'Что такое переменная в Ruby?',
  test: test1,
  score: 1,
  answers: [
    Answer.new(answer_text: 'Именованное хранилище данных', is_correct: true),
    Answer.new(answer_text: 'Тип данных', is_correct: false),
    Answer.new(answer_text: 'Метод', is_correct: false),
    Answer.new(answer_text: 'Класс', is_correct: false)
  ]
)

q2 = Question.create!(
  text: 'Как объявить массив в Ruby?',
  test: test1,
  score: 2,
  answers: [
    Answer.new(answer_text: 'array = [1, 2, 3]', is_correct: true),
    Answer.new(answer_text: 'array := (1, 2, 3)', is_correct: false),
    Answer.new(answer_text: 'array <- 1, 2, 3', is_correct: false),
    Answer.new(answer_text: 'array = {1; 2; 3}', is_correct: false)
  ]
)

q3 = Question.create!(
  text: 'Что делает метод puts в Ruby?',
  test: test1,
  score: 1,
  answers: [
    Answer.new(answer_text: 'Выводит строку в консоль', is_correct: true),
    Answer.new(answer_text: 'Сохраняет данные в файл', is_correct: false),
    Answer.new(answer_text: 'Создаёт переменную', is_correct: false),
    Answer.new(answer_text: 'Удаляет объект', is_correct: false)
  ]
)

q4 = Question.create!(
  text: 'Что делает тег <p> в HTML?',
  test: test2,
  score: 3,
  answers: [
    Answer.new(answer_text: 'Создаёт абзац текста', is_correct: true),
    Answer.new(answer_text: 'Добавляет картинку', is_correct: false),
    Answer.new(answer_text: 'Формирует таблицу', is_correct: false),
    Answer.new(answer_text: 'Выделяет заголовок', is_correct: false)
  ]
)

q5 = Question.create!(
  text: 'Как вставить ссылку в HTML?',
  test: test2,
  score: 1,
  answers: [
    Answer.new(answer_text: '<a href="...">Текст</a>', is_correct: true),
    Answer.new(answer_text: '<link src="...">', is_correct: false),
    Answer.new(answer_text: '<url>...</url>', is_correct: false),
    Answer.new(answer_text: '<ref="...">Ссылка</ref>', is_correct: false)
  ]
)

q6 = Question.create!(
  text: 'Для чего используется тег <img>?',
  test: test2,
  score: 4,
  answers: [
    Answer.new(answer_text: 'Для вставки изображения', is_correct: true),
    Answer.new(answer_text: 'Для оформления текста', is_correct: false),
    Answer.new(answer_text: 'Для создания формы', is_correct: false),
    Answer.new(answer_text: 'Для подключения скриптов', is_correct: false)
  ]
)

q7 = Question.create!(
  text: 'Сколько верблюдов поместится в переменную var?',
  test: test3,
  score: 2,
  answers: [
    Answer.new(answer_text: 'Только один, остальные убегут', is_correct: true),
    Answer.new(answer_text: 'Все верблюды мира', is_correct: false),
    Answer.new(answer_text: 'Ни одного, верблюды не переменные', is_correct: false),
    Answer.new(answer_text: 'Зависит от погоды в Монголии', is_correct: false)
  ]
)

q8 = Question.create!(
  text: 'Что произойдет если вызвать функцию до её объявления?',
  test: test3,
  score: 5,
  answers: [
    Answer.new(answer_text: 'JavaScript скажет "Сначала кофе"', is_correct: true),
    Answer.new(answer_text: 'Вселенная коллапсирует', is_correct: false),
    Answer.new(answer_text: 'Появится единорог', is_correct: false),
    Answer.new(answer_text: 'Все работает как обычно', is_correct: false)
  ]
)

q9 = Question.create!(
  text: 'Как правильно написать "Hello World" на jQuery?',
  test: test3,
  score: 4,
  answers: [
    Answer.new(answer_text: '$("body").text("Привет, мир и его окрестности")', is_correct: true),
    Answer.new(answer_text: 'jQuery.привет("мир")', is_correct: false),
    Answer.new(answer_text: 'document.write("Здравствуй, Вселенная")', is_correct: false),
    Answer.new(answer_text: 'console.log("Алоха, Галактика")', is_correct: false)
  ]
)

q10 = Question.create!(
  text: 'Что делает свойство float в CSS?',
  test: test4,
  score: 3,
  answers: [
    Answer.new(answer_text: 'Заставляет элементы плавать в воздухе', is_correct: true),
    Answer.new(answer_text: 'Выравнивает текст по центру', is_correct: false),
    Answer.new(answer_text: 'Меняет цвет фона', is_correct: false),
    Answer.new(answer_text: 'Добавляет тень', is_correct: false)
  ]
)

q11 = Question.create!(
  text: 'Как установить красный цвет фона у элемента?',
  test: test4,
  score: 5,
  answers: [
    Answer.new(answer_text: 'background-color: красная_краска', is_correct: true),
    Answer.new(answer_text: 'color: red', is_correct: false),
    Answer.new(answer_text: 'bg-color: #FF0000', is_correct: false),
    Answer.new(answer_text: 'background: tomato', is_correct: false)
  ]
)
