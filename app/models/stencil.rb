class Stencil < ActiveRecord::Base
  has_many :renderers
 
  def renderer_for(style)
    renderer = renderers.detect { |renderer| renderer.style_id == style.id }

    # Fall back to 'whiteboard' if we can't find the one we're looking for
    unless renderer
      renderer = renderers.detect { |renderer| renderer.style.default? }
    end

    # Still nothing? Grab the first one.
    renderer = renderers.first unless renderer

    renderer
  end
end
