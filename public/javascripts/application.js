var App = {
    Views: {},
    Controllers: {},
    init: function() {
        new App.Controllers.Boards();
        Backbone.history.start();
    }
};
