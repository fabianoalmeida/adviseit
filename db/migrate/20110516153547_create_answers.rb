class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :value, :length => 80
      t.references :quiz, :null => false
      t.references :subject, :null => false
      t.references :question, :null => false
      t.references :option, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
