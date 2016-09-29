class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.text :body
      t.integer :user_id, null: false
      t.integer :question_id, null: false
    end

    add_index :answer_choices, :user_id
    add_index :answer_choices, :question_id
  end
end
