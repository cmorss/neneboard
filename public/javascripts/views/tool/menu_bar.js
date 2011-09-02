
MenuBar = Backbone.View.extend({
  el: '#menu-bar',

  initialize: function() {
    this.render();
  },

  render: function() {
    this.$('ul').append(new MenuItem({ label: 'New NeneBoard...', action: 'new:board'}).el);
    this.$('ul').append(new MenuItem({label: 'Save', action: 'save:board'}).el);
  }
});

MenuItem = Backbone.View.extend({
  tagName: 'li',

  initialize: function() {
    var self = this;
    var link = $("<a/>", {href: '#'}).
                bind('click', function(e) {
                    $.event.trigger(self.action, {source: self})
                  });

    $('<span/>').appendTo(link);
    $(this.el).append(link);
  }
});