class CreateQuizzesSubjects < ActiveRecord::Migration
  def self.up
    create_table :quizzes_subjects, :id => false do |t|
      t.integer :quiz_id, :null => false
      t.integer :subject_id, :null => false
    end
  end

  def self.down
    drop_table :quizzes_subjects
  end
end
