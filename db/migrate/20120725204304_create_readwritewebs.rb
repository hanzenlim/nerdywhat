class CreateReadwritewebs < ActiveRecord::Migration
  def self.up
    create_table :readwritewebs do |t|
      t.text :name
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :readwritewebs
  end
end
