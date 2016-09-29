# == Schema Information
#
# Table name: questions
#
#  id      :integer          not null, primary key
#  body    :string           not null
#  poll_id :integer          not null
#

class Question < ActiveRecord::Base
  validates :body, :poll_id, :presence => true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_one :author,
    through: :poll,
    source: :author

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    answer_choices = self.answer_choices.includes(:responses)

    answer_count = {}

    answer_choices.each do |choice|
      answer_count[choice.body] = choice.responses.length
    end

    answer_count
  end
end
