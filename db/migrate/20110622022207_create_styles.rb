class CreateStyles < ActiveRecord::Migration
  def self.up
    create_table :styles, :force => true do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :styles
  end
end
