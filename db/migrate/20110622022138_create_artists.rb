class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists, :force => true do |t|
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
