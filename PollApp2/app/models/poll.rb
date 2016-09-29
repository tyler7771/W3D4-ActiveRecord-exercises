# == Schema Information
#
# Table name: polls
#
#  id        :integer          not null, primary key
#  title     :string           not null
#  author_id :integer          not null
#

class Poll < ActiveRecord::Base
  validates :title, :author_id, :presence => true
  
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :questions,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Question

  has_many :answer_choices,
    through: :questions,
    source: :answer_choices

  has_many :responses,
    through: :answer_choices,
    source: :responses
end
