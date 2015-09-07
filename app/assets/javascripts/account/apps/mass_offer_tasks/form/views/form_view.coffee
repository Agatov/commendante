@AccountApp.module "MassOfferTasksApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormView extends App.Views.ItemView
    template: "mass_offer_tasks/form/templates/form"
    className: "options-form"

    bindings: 
      'textarea[name=emails]': 'emails'

    events: 
      "click #js-create-task": "handleCreateTaskButtonClick"
      
    onShow: ->
      @stickit()
      @initValidation()

    handleCreateTaskButtonClick: (e) ->
      if @model.isValid("emails")
        @trigger "valid:form:submit", @model, @

    initValidation: ->
      Backbone.Validation.bind @,
        valid: (view, attr) ->
          $(view.el).find("[name=#{attr}]").removeClass("invalid")
        invalid: (view, attr, error) ->
          $(view.el).find("[name=#{attr}]").addClass("invalid")