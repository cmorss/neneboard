var Artist = Backbone.Model.extend({

  url: function() {
     var base = 'artists';
     if (this.isNew()) return base;
     return base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.id;
  },

  parse : function(resp, xhr) {
    return resp.artist;
  }
})