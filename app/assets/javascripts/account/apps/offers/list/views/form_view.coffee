@AccountApp.module "OffersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.FormView extends App.Views.ItemView
    template: "offers/list/templates/form"
    className: "new-offer-form"

    bindings: 
      "input[name=name]": "name"
      "input[name=email]": "email"

    events:
      "click #js-send-offer": "handleSendOfferButtonClick"


    onRender: ->
      @stickit()
      @initValidation()
    

    handleSendOfferButtonClick: ->
      if @model.isValid(["name", "email"])
        @trigger "valid:form:submit", @model, @
      

    initValidation: ->
      Backbone.Validation.bind @,
        valid: (view, attr) ->
          $(view.el).find("[name=#{attr}]").removeClass("invalid")
        invalid: (view, attr, error) ->
          $(view.el).find("[name=#{attr}]").addClass("invalid")