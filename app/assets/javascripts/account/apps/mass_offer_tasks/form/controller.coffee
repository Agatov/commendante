@AccountApp.module "MassOfferTasksApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  Form.Controller =

    show: ->
      mot = App.request "entities:mass:offer:task:new"
      layoutView = @getLayoutView()
      formView = @getFormView mot

      App.mainRegion.show layoutView
      layoutView.formRegion.show formView


    getLayoutView: ->
      view = new Form.LayoutView
      view

    getFormView: (mot) ->
      view = new Form.FormView
        model: mot

      view.on "valid:form:submit", (mot, view) ->
        App.vent.trigger "save:mass:offer:task", mot, ->
          view.model = App.request "entities:mass:offer:task:new"
          view.render()

          App.vent.trigger "show:alert",
            type: "success"
            content: "Рассылка отправляется"


      view
