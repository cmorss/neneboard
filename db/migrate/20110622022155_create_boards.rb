class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards, :force => true do |t|
      t.string :name
      t.references :artist
      t.references :style
      t.timestamps
    end
  end

  def self.down
    drop_table :boards
  end
end
