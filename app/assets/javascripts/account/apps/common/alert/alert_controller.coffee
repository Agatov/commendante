@AccountApp.module "CommonApp.Alert", (Alert, App, Backbone, Marionette, $, _) ->

  Alert.Controller = 

    show: (options) ->
      alertView = @getAlertView options
      App.alertRegion.show alertView

      reset = _.bind(App.alertRegion.reset, App.alertRegion)
      _.delay(reset, 2000)



    getAlertView: (options) ->
      switch options.type
        when "success"
          alertView = new Alert.SuccessView
            model: new App.Entities.Model
              content: options.content

        when "error"
          alertView = new Alert.ErrorView
            model: new App.Entities.Model
              content: options.content

      alertView



