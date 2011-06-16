class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :value, :length => 15, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
