# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, :presence => true
  validate :no_duplicate_responses
  validate :not_author_of_poll

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  has_one :author,
    through: :answer_choice,
    source: :author

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def sibling_responses
      self.question.responses.where("responses.id != ?", self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(respondent: self.respondent)
  end

  def no_duplicate_responses
    self.errors[:respondent] << "Already responded to poll" if respondent_already_answered?
  end

  def not_author_of_poll
    if self.author == self.respondent
      self.errors[:user_id] << "User is author of poll"
    end
  end
end
