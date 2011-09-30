class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.string :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end
