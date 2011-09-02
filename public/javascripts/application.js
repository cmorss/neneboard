
Handlebars.registerHelper('get', function() {
  target = arguments.length === 3 ? arguments[0] : this;
  attrName = arguments.length === 3 ? arguments[1] : arguments[0];
  return target.get(attrName);
});

App = {
    Views: {},
    Controllers: {},
    init: function(options) {

      App.tool = new Tool(options);

      App.tool.fetch({
        success: function(model, resp) {
          new ToolView({ model: App.tool });
        },
        error: function() {
          new Error({ message: 'Could not find that board.' });
          window.location.hash = '#';
        }
      });


    }
};
