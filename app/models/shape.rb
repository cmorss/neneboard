class Shape < ActiveRecord::Base
  belongs_to :stencil

  def to_json
    hash = {}
    
    %w(stencil_id x y rotation text scaleX scaleY).each do |attr|
      hash[attr] = self[attr]
    end

    ActiveSupport::JSON.encode(hash)
  end
end
