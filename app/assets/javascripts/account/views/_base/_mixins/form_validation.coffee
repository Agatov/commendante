@AccountApp.module "Views.Mixins", (Mixins, App, Backbone, Marionette, $, _) ->

  class Mixins.FormValidationView

    initializeFormValidationMixin: (attributes = []) ->

      Backbone.Validation.bind @,
        attributes: (view) =>

          if attributes.length > 0
            attributes
        valid: (view, attr) =>
          @trigger "valid"
          view.markInputBlockAsValid $(@el).find(".input-block.#{attr}")
        invalid: (view, attr, error) =>
          @trigger "invalid"
          @renderInputBlockError $(@el).find(".input-block.#{attr}"), error

    markAllInputBlocksAsValid: ->
      $(@el).find(".input-block").removeClass 'invalid'
      $(@el).find(".input-validation-error").text ""
 

    markInputBlockAsValid: (inputBlock) ->
      inputBlock.removeClass "invalid"
      inputBlock.find(".input-validation-error").text ""
          
    renderInputBlockError: (inputBlock, error) ->
      inputBlock.addClass "invalid"
      inputBlock.find(".input-validation-error").text error