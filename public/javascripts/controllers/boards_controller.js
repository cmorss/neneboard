App.Controllers.Boards = App.Controllers.Boards = {}

App.Controllers.Boards = Backbone.Router.extend({
    routes: {
        "boards/:id;edit":       "editBoaard",
        "boards/:id":            "showBoard",
        "boards":                "index",
        "boards/new":            "newBoard"
    },
    
    editBoard: function(id) {
        var board = new Board({ id: id });
        board.fetch({
            success: function(model, resp) {
                new App.Views.Boards.Edit({ model: board });
            },
            error: function() {
                new Error({ message: 'Could not find that board.' });
                window.location.hash = '#';
            }
        });
    },

    showBoard: function(id) {
      var board = new App.Models.Board({ id: id });
      board.fetch({
          success: function(board, resp) {
              new App.Views.Boards.Show({ model: board});
          },
          error: function() {
              new Error({ message: 'Could not find that board.' });
              window.location.hash = '#';
          }
      });
    },

    index: function() {
        $.getJSON('/boards', function(data) {
            if(data) {
                var boards = _(data).map(function(i) {
                  var board = new App.Models.Board(i.board);
                  return board;
                 });
                new App.Views.Boards.Index({ boards: boards });
            } else {
                new Error({ message: "Error loading boards." });
            }
        });
    },
    
    newBoard: function() {
        new App.Views.Boards.New({ model: new Board() });
    }
});