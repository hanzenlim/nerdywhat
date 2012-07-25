class CreateRedditProgrammings < ActiveRecord::Migration
  def self.up
    create_table :reddit_programmings do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :reddit_programmings
  end
end
