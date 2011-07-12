App.Views.Boards = App.Views.Boards || {}

App.Views.Boards.Index = Backbone.View.extend({

    initialize: function() {
        this.boards = this.options.boards;
        this.render();
    },

    render: function() {
        $(this.el).html(JST['boards/index'](this));
        $('#tool').html(this.el);
    }
});