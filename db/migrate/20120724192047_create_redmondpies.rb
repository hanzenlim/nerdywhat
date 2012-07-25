class CreateRedmondpies < ActiveRecord::Migration
  def self.up
    create_table :redmondpies do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :redmondpies
  end
end
