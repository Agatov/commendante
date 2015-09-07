@AccountApp.module "CommonApp.ModalConfirm", (ModalConfirm, App, Backbone, Marionette, $, _) ->

  class ModalConfirm.ModalConfirmView extends App.Views.ItemView
    template: 'common/modal_confirm/templates/modal'
    className: 'modal'

    events:
      'click .button.confirm': -> @trigger 'confirm:button:click'
      'click .button.cancel': -> @trigger 'cancel:button:click'

    initialize: ->
      vt = new App.Views.Mixins.ViewTransitions
      tsn = new App.Views.Mixins.TransitionSlideNone

      _.extend @, vt
      _.extend @, tsn 

  class ModalConfirm.ModalOverlayView extends Backbone.View
    className: 'modal-overlay'

    events: 
      'click': -> @trigger 'click'
