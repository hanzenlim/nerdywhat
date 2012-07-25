class CreateDiggs < ActiveRecord::Migration
  def self.up
    create_table :diggs do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :diggs
  end
end
