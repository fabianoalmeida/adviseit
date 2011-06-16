class CreateQuestionsSubjects < ActiveRecord::Migration
  def self.up
     create_table :questions_subjects, :id => false do |t|
      t.integer :question_id, :null => false
      t.integer :subject_id, :null => false
    end
  end

  def self.down
    drop_table :questions_subjects
  end
end
