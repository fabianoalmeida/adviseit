class AddFieldPreQuizToSubject < ActiveRecord::Migration
  def self.up
    add_column :subjects, :pre_quiz, :boolean
  end

  def self.down
    remove_column :subjects, :pre_quiz
  end
end
