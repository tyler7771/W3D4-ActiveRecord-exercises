# == Schema Information
#
# Table name: users
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_many :polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Poll

  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Response

  has_many :respondents,
    through: :responses,
    source: :respondent

  has_many :questions,
    through: :polls,
    source: :questions

  has_many :answer_choices,
    through: :questions,
    source: :answer_choices
end
