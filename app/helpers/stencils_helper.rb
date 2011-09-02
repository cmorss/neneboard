module StencilsHelper
  # Add a stencil renderer to a canvas
  def scriptize_renderer(canvas_id, renderer_instance_id, renderer)
    %Q[
      $d('#{canvas_id}').addStencilRenderer('#{renderer_instance_id}', '#{renderer.theme.name}',
        function(canvas, attrs) {
            var ctx = canvas.getContext('2d');
            ctx.save();
            #{renderer.script}
            ctx.restore();
        });
    ]
  end
end
 