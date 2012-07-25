class CreateLifeHackers < ActiveRecord::Migration
  def self.up
    create_table :life_hackers do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :life_hackers
  end
end
