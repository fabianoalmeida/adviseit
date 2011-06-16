class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.string :value, :length => 20, :null => false
      t.string :description, :length => 100
      t.references :status, :null => false
      t.references :subjects_quizze

      t.timestamps
    end
  end

  def self.down
    drop_table :quizzes
  end
end
