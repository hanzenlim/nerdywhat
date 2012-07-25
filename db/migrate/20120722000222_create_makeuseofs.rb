class CreateMakeuseofs < ActiveRecord::Migration
  def self.up
    create_table :makeuseofs do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :makeuseofs
  end
end
