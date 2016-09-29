# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: 'Brian')
User.create!(name: 'Tyler')
User.create!(name: 'Kyle')
User.create!(name: 'Todd')
User.create!(name: 'Lizzie')
User.create!(name: 'Vince')
User.create!(name: 'Ish')

Poll.create!(title: 'App Academy', author_id: 1)
Poll.create!(title: 'Happy Hour', author_id: 2)

Question.create!(body: "Are you ready for assessment 3?", poll_id: 1)
Question.create!(body: "Do you want free beer?", poll_id: 2)

AnswerChoice.create!(body: "Yes", question_id: 1)
AnswerChoice.create!(body: "No", question_id: 1)
AnswerChoice.create!(body: "Not sure", question_id: 1)
AnswerChoice.create!(body: "Hell No", question_id: 1)
AnswerChoice.create!(body: "Yes", question_id: 2)
AnswerChoice.create!(body: "No", question_id: 2)

Response.create!(user_id: 1, answer_choice_id: 4)
Response.create!(user_id: 2, answer_choice_id: 3)
Response.create!(user_id: 3, answer_choice_id: 2)
Response.create!(user_id: 4, answer_choice_id: 1)
Response.create!(user_id: 5, answer_choice_id: 1)
Response.create!(user_id: 6, answer_choice_id: 2)
Response.create!(user_id: 7, answer_choice_id: 3)
Response.create!(user_id: 1, answer_choice_id: 6)
Response.create!(user_id: 2, answer_choice_id: 5)
Response.create!(user_id: 3, answer_choice_id: 5)
Response.create!(user_id: 4, answer_choice_id: 5)
Response.create!(user_id: 5, answer_choice_id: 5)
Response.create!(user_id: 6, answer_choice_id: 5)
Response.create!(user_id: 7, answer_choice_id: 5)
