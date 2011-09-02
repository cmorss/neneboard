class StencilGroups < ActiveRecord::Migration
  def self.up
   create_table :stencil_groups, :force => true do |t|
     t.string :label
   end
  end

  def self.down
    drop_table :stencil_groups
  end
end
