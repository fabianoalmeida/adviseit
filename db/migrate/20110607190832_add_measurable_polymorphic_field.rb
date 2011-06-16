class AddMeasurablePolymorphicField < ActiveRecord::Migration
  def self.up
    add_column :quizzes, :measurable_id, :integer
    add_column :quizzes, :measurable_type, :string
  end

  def self.down
    remove_column :quizzes, :measurable_id
    remove_column :quizzes, :measurable_type
  end
end
