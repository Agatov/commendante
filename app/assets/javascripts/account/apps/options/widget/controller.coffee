@AccountApp.module "OptionsApp.Widget", (Widget, App, Backbone, Marionette, $, _) ->

  Widget.Controller =

    save: (widget, cb) ->
      widget.save null,
        success: ->
          cb() if cb