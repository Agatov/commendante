@AccountApp.module "CommonApp", (CommonApp, App, Backbone, Marionette, $, _) ->

  API =

    showConfirmModal: (options) ->
      CommonApp.ModalConfirm.Controller.show options

    hideConfirmModal: ->
      CommonApp.ModalConfirm.Controller.hide()

    showAlert: (options) ->
      CommonApp.Alert.Controller.show options


  App.vent.on "show:confirm:modal", (options) ->
    API.showConfirmModal options

  App.vent.on "hide:confirm:modal", ->
    API.hideConfirmModal()

  App.vent.on "show:alert", (options) ->
    API.showAlert options

