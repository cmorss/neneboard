class Stencil < ActiveRecord::Base
  has_many :renderers
  has_and_belongs_to_many :stencil_groups

  def renderer_for(theme)
    renderer = renderers.detect { |renderer| renderer.theme_id == theme.id }

    # Fall back to 'whiteboard' if we can't find the one we're looking for
    unless renderer
      renderer = renderers.detect { |renderer| renderer.theme.default? }
    end

    # Still nothing? Grab the first one.
    renderer = renderers.first unless renderer

    renderer
  end
end
