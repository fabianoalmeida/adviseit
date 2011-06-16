class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string :value, :length => 50, :null => false
      t.references :status, :null => false
      t.references :subjects_question
      t.references :subjects_quizze

      t.timestamps
    end
  end

  def self.down
    drop_table :subjects
  end
end
