class Board < ActiveRecord::Base
  belongs_to :artist
  belongs_to :style
  has_many :shapes
end
