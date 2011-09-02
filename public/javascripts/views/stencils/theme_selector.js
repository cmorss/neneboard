App.Views.Themes = App.Views.Themes || {}

App.Views.ThemeSelector = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, 'render');
//    this.render();
  },

  getPreferredDimensions: function() {
    return { height: 45, width: 100 };
  },

  render: function() {

    var selectedTheme = $(this.make("div", {id: 'selected-theme'}));
    selectedTheme.append("<img>");
    selectedTheme.append("<span>");

    $(this.el).append(selectedTheme);

    var ul = $("<ul>", {id: 'themes'});
    
    this.options.themes.forEach(function(theme) {
        ul.append(new App.Views.ThemeView(theme).el);
      }.bindTo(this)
    );

    $(this.el).append(ul);
  }
});

