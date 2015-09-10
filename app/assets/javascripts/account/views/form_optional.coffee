 @AccountApp.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  class Views.FormOptional extends App.Views.ItemView
    className: "options-form"

    onShow: ->
      @stickit()

    onInputChange: (e) ->
      $(e.target).attr "disabled", true
      @trigger "form:state:changed", @model, $(e.target)

    onSelectChange: (target) ->
      @trigger "form:state:changed", @model, target

    onCheckboxChange: (target) ->
      @trigger "form:state:changed", @model, target

    fieldUpdated: (element) ->
      $(element).removeAttr "disabled"
      $(element).parent().find("label").addClass "update-success"

    onInputFocus: (e) ->
      $(e.target).parent().find("label").removeClass "update-success"