class CreateSlickdeals < ActiveRecord::Migration
  def self.up
    create_table :slickdeals do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :slickdeals
  end
end
