App.Models = App.Models || {}

App.Models.Theme = Backbone.Model.extend({
  defaults: {
    name: null,
    thumbnailPath: "/images/thumbnails/themes/default.png"
  },

  url: function() {
     var base = 'themes';
     if (this.isNew()) return base;
     return base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.id;
  },

  parse : function(resp, xhr) {
    return resp.theme;
  }
})


App.Models.ThemesCollection = Backbone.Collection.extend({
  model: App.Models.Theme,
  url: '/themes'
});
