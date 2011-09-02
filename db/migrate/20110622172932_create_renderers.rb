class CreateRenderers < ActiveRecord::Migration
  def self.up
    create_table :renderers do |t|
      t.references :stencil, null: false
      t.references :theme, null: false
      t.text :script, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :renderers
  end
end
