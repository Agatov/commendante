@AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.EmailTemplate extends Entities.Model
    url: "/account/email_template"
    idAttribute: 'id'

  API = 

    getEmailTemplate: (cb) ->
      etLoaded = App.request "entities:email:template:loaded"
      if etLoaded
        cb(etLoaded)
        return etLoaded
      
      et = new Entities.EmailTemplate
        id: 1
      et.fetch
        success: ->
          App.reqres.setHandler "entities:email:template:loaded", ->
            et

          cb(et) if cb

  App.reqres.setHandler "entities:email:template", (cb) ->
    API.getEmailTemplate cb