class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :value, :length => 80, :null => false
      t.references :status, :null => false
      t.references :form, :null => false
      t.references :subjects_question

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
