class PropertiesView extends Backbone.View

  el: '#properties',

  initialize: ->
    this.render();
#    $(this.el).bind('resize', this.handleResize)

  getPreferredDimensions: =>
    return { width: 210 };

  render: =>
    contents = this.make('div', id: 'property-contents')
    dialog   = this.make('div', id: 'property-dialog')

    $(this.el).html JST['tool/pane'](
      title: 'Properties',
      content: 'The properties content goes here...'
     )

#  handleResize: =>
#    $('#property-dialog').dialog('option', 'height', $(this.el).height());
#    $('#property-dialog').dialog('option', 'width', $(this.el).width());
