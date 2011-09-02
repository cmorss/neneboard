class ThemeView extends Backbone.View
  tag: 'li',
  
  initialize: ->
    this.render()

  getPreferredDimensions: =>
    height: 45
    width: 45

  domId: =>
    'theme-' + @options.theme.get('id')

  render: =>
    li = $(this.make("li", id: this.domId()))
    img = $(this.make("img",
        src: this.options.theme.get('thumbnailPath')
        alt: ""
        title: "")
      )
    $(@el).append(li).append(img)