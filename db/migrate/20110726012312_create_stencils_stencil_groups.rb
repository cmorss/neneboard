class CreateStencilsStencilGroups < ActiveRecord::Migration
  def self.up
    create_table :stencil_groups_stencils, :force => true, :id => false do |t|
      t.integer :stencil_group_id
      t.integer :stencil_id
    end
  end

  def self.down
    drop_table :stencil_groups_stencils
  end
end
