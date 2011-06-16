class AddFieldDisableToSubject < ActiveRecord::Migration
  def self.up
    add_column :subjects, :disable, :boolean
  end

  def self.down
    remove_column :subjects, :disable
  end
end
