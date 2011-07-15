App.Models = App.Models || {}

App.Models.Board = Backbone.Model.extend({
  defaults: {
    name: null
  },

  url: function() {
     var base = 'boards';
     if (this.isNew()) return base;
     return base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.id;
  },

  parse : function(resp, xhr) {
    return resp.board;
  }
})