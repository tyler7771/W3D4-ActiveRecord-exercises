# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  body        :text
#  question_id :integer          not null
#

class AnswerChoice < ActiveRecord::Base
  validates :question_id, :presence => true

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

  has_one :poll,
    through: :question,
    source: :poll

  has_one :author,
    through: :poll,
    source: :author

  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :Response

  has_one :respondent,
    through: :responses,
    source: :respondent
end
