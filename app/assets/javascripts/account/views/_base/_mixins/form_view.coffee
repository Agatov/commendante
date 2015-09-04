@AccountApp.module "Views.Mixins", (Mixins, App, Backbone, Marionette, $, _) ->

  class Mixins.FormView

    formEvents:
      "click .button[behavior='cancel']": -> @trigger 'cancel:button:click'
      "click .button[behavior='submit-form']": 'handleSendFormButtonClick'

    initializeFormView: (attributes = []) ->

      fvv = new App.Views.Mixins.FormValidationView
      _.extend @, fvv 

      @initializeFormValidationMixin(attributes)

      if @events
        _.extend @events, @formEvents
      else
        @events = @formEvents

    handleSendFormButtonClick: ->
      @model.validate()
      if @model.isValid()
        @.trigger 'valid:form:submit', @model