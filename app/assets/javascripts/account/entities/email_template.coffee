@AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.EmailTemplate extends Entities.Model
    url: "/account/email_template"
    idAttribute: 'id'

  API = 

    getEmailTemplate: (cb) ->
      et = new Entities.EmailTemplate
        id: 1
      et.fetch
        success: ->
          cb(et) if cb

  App.reqres.setHandler "entities:email:template", (cb) ->
    API.getEmailTemplate cb