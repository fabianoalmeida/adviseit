class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :value, :length => 80, :null => false
      t.boolean :has_text_field
      t.references :status, :null => false
      t.references :forms_option

      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
