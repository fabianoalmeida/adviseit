class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :value, :length => 40, :null => false
      t.references :company, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :departments
  end
end
