@AccountApp.module "MassOfferTasksApp.MassOfferTask", (MassOfferTask, App, Backbone, Marionette, $, _) ->

  MassOfferTask.Controller = 

    save: (mot, cb) ->
      mot.save null,
        success: ->
          cb() if cb