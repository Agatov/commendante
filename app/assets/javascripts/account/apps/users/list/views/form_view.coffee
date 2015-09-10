@AccountApp.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.FormView extends App.Views.ItemView
    template: "users/list/templates/form"
    className: "add-user-form"

    bindings: 
      "input[name=email]": "email"
      "select[name=role]": "role"

    events:
      "click .js-add-user": "handleAddUserButtonClick"
    

    onRender: ->
      @stickit()
      @initValidation()

    handleAddUserButtonClick: ->
      if @model.isValid("email")
        @trigger "valid:form:submit", @model, @


    initValidation: ->
      Backbone.Validation.bind @