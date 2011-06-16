class AddFieldMultipleToForm < ActiveRecord::Migration
  def self.up
    add_column :forms, :multiple, :boolean
  end

  def self.down
    remove_column :forms, :multiple
  end
end
