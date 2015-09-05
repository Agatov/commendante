@AccountApp.module "OptionsApp.Page", (Page, App, Backbone, Marionette, $, _) ->

  Page.Controller =

    show: ->
      layoutView = @getLayoutView()
      installView = @getInstallView()
      formView = @getFormView()

      App.mainRegion.show layoutView
      layoutView.installRegion.show installView
      layoutView.formRegion.show formView


    getLayoutView: ->
      view = new Page.LayoutView
      view

    getInstallView: ->
      view = new Page.InstallView
        model: (new Backbone.Model({widget_code: App.request("get:widget:code")}))
      view

    getFormView: ->
      view = new Page.FormView
        model: App.request("get:widget")

      view.on "form:state:changed", (widget, element) ->
        App.vent.trigger "save:widget", widget, ->
          view.fieldUpdated element

      view