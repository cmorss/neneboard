// Add a Handlebar.js templating function to your JavaScript:

Handlebars.template = function(templateString) {
  return function () {
    if (arguments.length < 1) {
      // With no arguments, return the raw template -- useful for rendering
      // partials.
      return templateString;
    } else {
      Handlebars.templates = Handlebars.templates || {}
      Handlebars.templates[templateString] = Handlebars.templates[templateString] || Handlebars.compile(templateString);
      return Handlebars.templates[templateString](arguments[0], arguments[1])
    }
  };
};

// Ripped from prototype.js
Function.prototype.bindTo = function(context) {
  if (arguments.length < 2 && _.isUndefined(arguments[0])) return this;
  var __method = this, args = Array.prototype.slice.call(arguments, 1);
  return function() {
    return __method.apply(context, args.concat(Array.prototype.slice.call(arguments)));
  }
};

$w = function(string) {
  if (_)
    return _.compact(string.split(' '));
  else
    return string.split(' ');
};

Helpers = {
  wrapError: function(onError, model, options) {
    return function(resp) {
      if (onError) {
        onError(model, resp, options);
      } else {
        model.trigger('error', model, resp, options);
      }
    };
  },

  viewportDimensions: function() {
    var viewportwidth;
    var viewportheight;

    // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight

    if (typeof window.innerWidth != 'undefined') {
      viewportwidth = window.innerWidth,
        viewportheight = window.innerHeight
    }

    // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)

    else if (typeof document.documentElement != 'undefined'
      && typeof document.documentElement.clientWidth !=
      'undefined' && document.documentElement.clientWidth != 0) {
      viewportwidth = document.documentElement.clientWidth;
      viewportheight = document.documentElement.clientHeight;
    }

    // older versions of IE

    else {
      viewportwidth = document.getElementsByTagName('body')[0].clientWidth;
      viewportheight = document.getElementsByTagName('body')[0].clientHeight;
    }
    return {width: viewportwidth, height: viewportheight};
  }

}


