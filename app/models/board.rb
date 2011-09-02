class Board < ActiveRecord::Base
  belongs_to :artist
  belongs_to :theme
  has_many :shapes
end
