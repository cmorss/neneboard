class StencilGroup < ActiveRecord::Base
  has_and_belongs_to_many :stencils
end