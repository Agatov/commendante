@AccountApp.module "CommonApp.ModalConfirm", (ModalConfirm, App, Backbone, Marionette, $, _) ->

  ModalConfirm.Controller =

    show: (options = {}) ->
      modalView = @getModalView (options)
      modalOverlayView = @getModalOverlayView()

      App.modalRegion.show modalView
      App.modalOverlayRegion.show modalOverlayView

    hide: ->
      App.modalOverlayRegion.reset()
      App.modalRegion.reset()


    getModalOverlayView: ->
      modalOverlayView = new ModalConfirm.ModalOverlayView 

      modalOverlayView.on "click", ->
        App.vent.trigger "hide:confirm:modal"

      modalOverlayView

    getModalView: (options) ->
      modalView = new ModalConfirm.ModalConfirmView
        model: new App.Entities.Model({content: options.content})

      modalView.on "confirm:button:click", ->
        App.vent.trigger "hide:confirm:modal"
        options.onConfirm()
        

      modalView.on "cancel:button:click", ->
        App.vent.trigger "hide:confirm:modal"

      modalView
