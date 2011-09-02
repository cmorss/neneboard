class Artist extends Backbone.Model

  url: => 
    base = 'artists'
    if this.isNew()
      return base
    base + (base.charAt(base.length - 1) == '/' ? '' : '/') + @id
