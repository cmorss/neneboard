App.Views.Boards = App.Views.Boards || {}

App.Views.Boards.Show= Backbone.View.extend({

    initialize: function() {
        this.render();
    },

    render: function() {
        $(this.el).html(JST['boards/show']({board: this.model}));
        $('#tool').append(this.el);
    }
});