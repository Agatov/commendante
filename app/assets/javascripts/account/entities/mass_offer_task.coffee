@AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.MassOfferTask extends Entities.Model
    urlRoot: "/account/mass_offer_tasks"

    validation:
      emails: [
        { 
          required: true
          msg: 'Это поле обязательно для заполнения'
        }
      ]

  API = 

    getNewMOT: ->
      new Entities.MassOfferTask

  App.reqres.setHandler "entities:mass:offer:task:new", ->
    API.getNewMOT()