class CreateTechCrunches < ActiveRecord::Migration
  def self.up
    create_table :tech_crunches do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :tech_crunches
  end
end
