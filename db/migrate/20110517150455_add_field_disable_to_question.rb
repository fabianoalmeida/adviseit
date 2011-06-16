class AddFieldDisableToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :disable, :boolean
  end

  def self.down
    remove_column :questions, :disable
  end
end
