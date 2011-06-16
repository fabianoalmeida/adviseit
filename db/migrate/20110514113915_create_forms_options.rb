class CreateFormsOptions < ActiveRecord::Migration
  def self.up
    create_table :forms_options, :id => false do |t|
      t.integer :option_id, :null => false
      t.integer :form_id, :null => false
    end
  end

  def self.down
    drop_table :forms_options
  end
end
