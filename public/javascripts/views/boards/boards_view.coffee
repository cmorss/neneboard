class BoardsView extends Backbone.View

  initialize: ->
      @boards = @options.boards
      this.render()

  render: =>
      $(@el).html(JST['boards/boards_view'](this))
      $('#tool').append(@el);
 