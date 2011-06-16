class AddFieldHasTextFieldToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :has_text_field, :boolean
  end

  def self.down
    remove_column :questions, :has_text_field
  end
end
