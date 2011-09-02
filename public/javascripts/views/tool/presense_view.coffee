class PresenseView extends Backbone.View

  initialize: ->
    this.render()

  render: =>
    $(@el).html(JST['tool/presense_view'] artist: App.tool.get('artist'))

    this.$("#artist-email, #user-actions")
      .mouseenter(=>
        clearTimeout(this.$('#user-actions').data('timeoutId'))
        this.$('#user-actions').show()
      )
      .mouseleave(=>
        timeoutId = setTimeout(=>
          this.$('#user-actions').hide()
        ,350)
       
        this.$('#user-actions').data('timeoutId', timeoutId)
      )
   
    this
   
  getPreferredDimensions: =>
    { height: 52 }
