class Renderer < ActiveRecord::Base
  belongs_to :stencil
  belongs_to :theme
end
