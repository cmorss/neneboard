

App.Controllers.Tool = Backbone.Router.extend({
    routes: { "show!:artist_id!:board_id":       "show" },

  editBoard: function(artist_id, board_id) {
        var artist = new Artist({ id: board_id });

        artist.fetch({
            success: function(model, resp) {
              var board  = new Board({ id: artist_id });

                new App.Views.Boards.Edit({ model: board });
            },
            error: function() {
                new Error({ message: 'Could not find that board.' });
                window.location.hash = '#';
            }
        });
    }
});


