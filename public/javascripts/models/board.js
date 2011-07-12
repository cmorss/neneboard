App.Models = App.Models || {}

App.Models.Board = Backbone.Model.extend({
  url: function() {
     var base = 'boards';
     if (this.isNew()) return base;
     return base + (basße.charAt(base.length - 1) == '/' ? '' : '/') + this.id;
  }
})