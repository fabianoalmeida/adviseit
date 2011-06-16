class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string :value, :length => 50, :null => false
      t.references :status, :null => false
      t.references :forms_option

      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
