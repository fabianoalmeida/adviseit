class CreateCostCenters < ActiveRecord::Migration
  def self.up
    create_table :cost_centers do |t|
      t.string :value, :length => 40, :null => false
      t.references :department, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :cost_centers
  end
end
