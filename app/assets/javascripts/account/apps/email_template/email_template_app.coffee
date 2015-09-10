@AccountApp.module "EmailTemplateApp", (EmailTemplateApp, App, Backbone, Marionette, $, _) ->

  class EmailTemplateApp.Router extends Marionette.AppRouter
    appRoutes:
      'email_template(/)': 'show'

  App.addInitializer ->
    new EmailTemplateApp.Router
      controller: API

  API =

    show: ->
      EmailTemplateApp.Form.Controller.show()

    save: (et, cb) ->
      EmailTemplateApp.EmailTemplate.Controller.save et, cb

  App.vent.on "show:email:template", ->
    App.navigate "email_template"
    API.show()

  App.vent.on "save:email:template", (et, cb) ->
    API.save et, cb

