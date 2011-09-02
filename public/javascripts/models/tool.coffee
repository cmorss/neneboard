class Tool extends Backbone.Model
  defaults:
    board: null
    artist: null
    stencils: new StencilsCollection()
    stencilGroups: new StencilGroupsCollection()
    themes: new ThemesCollection()

  initialize: (attributes) ->
    this.set(
      board: new App.Models.Board( id: attributes.boardId )
      artist: new Artist( id: attributes.artistId )
    )

  # ?artist_id=1&board_id=1
  url: =>
    '/tool/load?artist_id=' + this.get('artistId') + '&board_id=' + this.get('boardId')

  fetch : (options) =>
    options |= {}

    tool = this
    success = options.success

    options.success = (resp, status, xhr) =>
      board = tool.get('board')
      board.set(board.parse(resp.board))

      shapes = board.get('shapes')
      shapes.reset(shapes.parse(resp.shapes))

      artist = tool.get('artist')

      stencils = tool.get('stencils')
      stencils.reset(stencils.parse(resp.stencils))

      stencilGroups = tool.get('stencilGroups')
      stencilGroups.reset(stencilGroups.parse(resp.stencil_groups))

      stencilGroupHash = {}
      stencilGroups.forEach (stencilGroup) =>
         stencilGroupHash[stencilGroup.get('id')] = stencilGroup

      themes = tool.get('themes')
      themes.parse(resp.themes)

      # Connect everything up so we can navigate the object graph
      artist.set(artist.parse(resp.artist))
      board.set(artist: artist, shapes: shapes)

      stencilHash = {}
      stencils.forEach (stencil) =>
        stencilHash[stencil.get('id')] = stencil

        # Put the groups on each stencil
        stencil.get('stencilGroups').reset \
          _.map(resp.stencil_to_group_map[stencil.get('id')], (groupId) => stencilGroupHash[groupId])

        # Add this stencil to each of the groups it's in
        stencil.get('stencilGroups').forEach (group) =>
          group.get('stencils').add(stencil)

        console.log('done w/ stencil ', stencil.get('name'))

      shapes.forEach (shape) =>
        shape.set(board: board, stencil: stencilHash[shape.get('stencil_id')])

      success(tool, resp)

    options.error = Helpers.wrapError(options.error, tool, options)
    (this.sync || Backbone.sync).call(this, 'read', this, options)