class CreateHackerPics < ActiveRecord::Migration
  def self.up
    create_table :hacker_pics do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :hacker_pics
  end
end
