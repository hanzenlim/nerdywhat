class CreateHackerNews < ActiveRecord::Migration
  def self.up
    create_table :hacker_news do |t|
      t.string :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :hacker_news
  end
end
