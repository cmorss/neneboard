Handlebars.template = (templateString) ->
    ->
      if arguments.length < 1
        # With no arguments, return the raw template -- useful for rendering partials.
        templateString
      else
        Handlebars.templates ?= {}
        Handlebars.templates[templateString] ?= Handlebars.compile(templateString)
        Handlebars.templates[templateString](arguments[0], arguments[1])

Handlebars.registerHelper 'input', (options) ->
  opts = ['<input']
  for opt in options.hash
    opts.push("#{opt}=\"#{options.hash[opt]}\"")

  opts.push(">")
  new Handlebars.SafeString opts.join(' ')

Handlebars.registerHelper 'radio_button', (options) ->
  options.hash.type = 'radio'
  Handlebars.helpers['input'](options)

Handlebars.registerHelper 'concat', (options) ->
  strings = Array::slice.call(arguments, 0, arguments.length-1)
  strings.join('')

Handlebars.registerHelper 'upcase', (string) ->
  string.toUpperCase()

Handlebars.registerHelper 'downcase', (string) ->
  string.toLowerCase()

Handlebars.registerHelper 'debug', (optionalValue) ->
  if console
    console.log("Current context:", this)
    console.log("Debug value:", optionalValue) if optionalValue

Handlebars.registerHelper 'ifEqual', (arg1, arg2, block) ->
  if arg1 is arg2
    block(this)
  else
    block.inverse(this)

Handlebars.registerHelper 'ifNotEqual', (arg1, arg2, block) ->
  if arg1 isnt arg2
    block(this)
  else
    block.inverse(this);

###
  `log` allows you to output the value of a value in the current rendering
  context.

    {{log myVariable}}

  @name Handlebars.helpers.log
  @param {String} property
###

Handlebars.registerHelper 'log', (property) ->
  if console
    console.log(getPath(this, property))

### 
  The `debugger` helper executes the `debugger` statement in the current
  context.

    {{debugger}}

  @name Handlebars.helpers.debugger
  @param {String} property
### 

Handlebars.registerHelper 'debugger', ->
  debugger

###
  If a Formatter is defined added all the functions on it as helper methods.
###

if Formatter?
  for functionName in _.functions(Formatter)
    context = this;
    Handlebars.registerHelper funcName, ->
      new Handlebars.SafeString(Formatter[funcName].apply(context, arguments));

###
  If underscore.string.js _s is available, add all the string formatting love as helpers.
###

if _s?
  for functionName in _.functions(_s)
    context = this;
    Handlebars.registerHelper funcName, ->
      new Handlebars.SafeString(Formatter[funcName].apply(context, arguments));
