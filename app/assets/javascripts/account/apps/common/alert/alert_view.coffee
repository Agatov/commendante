@AccountApp.module "CommonApp.Alert", (Alert, App, Backbone, Marionette, $, _) ->

  class Alert.SuccessView extends App.Views.ItemView
    template: "common/alert/templates/alert"
    className: "alert"

    initialize: ->
      vt = new App.Views.Mixins.ViewTransitions
      to = new App.Views.Mixins.TransitionOpacity
      _.extend @, vt
      _.extend @, to



  class Alert.ErrorView extends Alert.SuccessView
    template: "common/alert/templates/alert"