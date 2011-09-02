class ToolView extends Backbone.View

  el: 'body'
    
  initialize: ->
    @artist =        @model.get('artist')
    @board =         @model.get('board')
    @stencils =      @model.get('stencils')
    @stencilGroups = @model.get('stencilGroups')
    @themes =        @model.get('themes')
    this.render()
    _.defer(this.handleResize)

  render: =>
    $(@el).html JST['tool/tool_view']()

    @stencilsView = new StencilsView(
      el:            '#stencils'
      themes:        @themes
      stencils:      @stencils
      stencilGroups: @stencilGroups
    )

    @presenceView = new PresenseView(
      el:       '#presense'
      themes:   @themes
      stencils: @stencils
    )

    @propertiesView = new PropertiesView(
      el:       '#properties'
      themes:   @themes
      stencils: @stencils
    )

    @workspaceView = new WorkspaceView(
      el:    '#workspace'
      tool:  @model
      board: @board
    )

    $('body').layout(
      defaults:
        resizable: false
        closable: false
        slidable: false
      north:
        size: @stencilsView.getPreferredDimensions().height + @presenceView.getPreferredDimensions().height
      west:
        size: 45
      east:
        size: @propertiesView.getPreferredDimensions().width
        resizable: true
        closable: true
        slidable: true
    )

  toolElement:         => this.$('#tool')
  upperElement:        => this.$('#upper')
  toolPalletElement:   => this.$('#tool-pallete')
  menubarElement:      => this.$('#menu-bar')
  rightSidebarElement: => this.$('#right-sidebar')
  workspaceElement:    => this.$('#workspace')

  handleResize: =>
    return
    vd = Helpers.viewportDimensions()
    windowHeight = vd.height
    windowWidth = vd.width

    this.toolElement().css({height: windowHeight + 'px'})
    
    this.upperElement().css(
      width: windowWidth + 'px'
      height: '34px'
    )
    
    this.rightSidebarElement().css(
      top:    this.upperElement().height() + 'px'
      width: '250px'
      right: '0px'
      height: windowHeight - this.upperElement().height()
    )

    this.toolPalletElement().css(
      top:    this.upperElement().height() + 'px'
      width: '70px'
      height: windowHeight - this.upperElement().height()
    )

    this.workspaceElement().css(
      left:   this.toolPalletElement().width() + 'px'
      top:    this.upperElement().height() + 'px'
      width:  windowWidth - this.rightSidebarElement().width() - this.toolPalletElement().width() + 'px'
      height: windowHeight - this.upperElement().height() + 'px'
    )

    this.stencilsView.handleResize();
    this.propertiesView.handleResize();
