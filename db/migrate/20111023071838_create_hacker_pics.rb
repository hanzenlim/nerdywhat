class CreateHackerPics < ActiveRecord::Migration
  def self.up
    create_table :hacker_pics do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :hacker_pics
  end
end
