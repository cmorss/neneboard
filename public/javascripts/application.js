
Handlebars.registerHelper('get', function() {
  target = arguments.length === 3 ? arguments[0] : this;
  attrName = arguments.length === 3 ? arguments[1] : arguments[0];
  debugger;
  return target.get(attrName);
});

var App = {
    Views: {},
    Controllers: {},
    init: function() {
        new App.Tool();
        Backbone.history.start();
    }
};
