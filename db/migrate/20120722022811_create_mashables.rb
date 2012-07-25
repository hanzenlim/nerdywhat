class CreateMashables < ActiveRecord::Migration
  def self.up
    create_table :mashables do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :mashables
  end
end
