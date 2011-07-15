App.Views.Tool = App.Views.Tool || {}

App.Views.Tool.Show = Backbone.View.extend({

    initialize: function() {
        this.render();
    },

    render: function() {
        $(this.el).html(JST['tool/tool']({
          artist: this.options.artist,
          board:  this.model
        }));
    }
});