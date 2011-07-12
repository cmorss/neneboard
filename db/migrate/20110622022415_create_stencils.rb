class CreateStencils < ActiveRecord::Migration
  def self.up
    create_table :stencils, :force => true do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :stencils
  end
end
