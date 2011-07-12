class CreateCollaborators < ActiveRecord::Migration
  def self.up
    create_table :collaborators do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :collaborators
  end
end
