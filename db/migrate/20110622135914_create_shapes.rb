class CreateShapes < ActiveRecord::Migration
  def self.up
    create_table :shapes, :force => true do |t|
      t.references :stencil

      t.integer :x
      t.integer :y
      t.integer :height
      t.integer :width
      t.integer :radius
      t.integer :rotation
      t.string  :text
      t.integer :scaleX
      t.integer :scaleY

      t.timestamps
    end
  end

  def self.down
    drop_table :shapes
  end
end
