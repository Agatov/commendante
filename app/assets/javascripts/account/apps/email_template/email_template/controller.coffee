@AccountApp.module "EmailTemplateApp.EmailTemplate", (EmailTemplate, App, Backbone, Marionette, $, _) ->

  EmailTemplate.Controller = 

    save: (et, cb) ->
      et.save null,
        success: ->
          cb() if cb