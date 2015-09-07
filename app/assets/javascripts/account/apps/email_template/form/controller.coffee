@AccountApp.module "EmailTemplateApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  Form.Controller = 

    show: ->
      App.request "entities:email:template", (et) =>
        layoutView = @getLayoutView()
        formView = @getFormView et

        App.mainRegion.show layoutView
        layoutView.formRegion.show formView


    getLayoutView: ->
      view = new Form.LayoutView
      view

    getFormView: (et) ->
      view = new Form.FormView
        model: et

      view.on "form:state:changed", (et, element) ->
        App.vent.trigger "save:email:template", et, ->
          view.fieldUpdated element

      view