(function($){

    $.fn.extend({

      // This will add a stencil script to the element passed in.
      // Doesnt' really make sense to have to add the function to
      // an element, but it makes easy to get one. Just use the data attribute
      addStencilRenderer: function(instanceId, styleName, renderFunction) {
          return this.each(function() {
            console.log('adding renderer', instanceId);
            $(this).data(instanceId, {renderFunction: renderFunction, styleName: styleName});
          });
      },

      renderStencil: function(instanceId, attributes) {
        return this.each(function() {
          attributes.width = attributes.width || $(this).width();
          attributes.height = attributes.height || $(this).height();
          $(this).data(instanceId).renderFunction(this, attributes);
        });
      }
    });

})(jQuery);