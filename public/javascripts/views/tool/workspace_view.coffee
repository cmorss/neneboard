class WorkspaceView extends Backbone.View

  initialize: ->
    this.render()

  render: =>
    @boardView    = new BoardView(board: @options.board)
    @timelineView = new TimelineView(board: @options.board)

    $(@el).append(@boardView.el)
    $(@el).append(@timelineView.el)

  resize: =>
    parentHeight = $(@el).height()
    $(@boardView.el).css(height: parentHeight - 200 + 'px')
    $(@timelineView.el).css(height: '200px')
