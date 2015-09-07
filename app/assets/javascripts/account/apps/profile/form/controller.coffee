@AccountApp.module "ProfileApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  Form.Controller =

    show: ->
      layoutView = @getLayoutView()
      formView = @getFormView App.request("get:profile")

      App.mainRegion.show layoutView
      layoutView.formRegion.show formView


    getLayoutView: ->
      view = new Form.LayoutView
      view

    getFormView: (profile) ->
      view = new Form.FormView
        model: profile

      view.on "form:state:changed", (profile, element) ->
        App.vent.trigger "save:profile", profile, ->
          view.fieldUpdated element

      view.on "send:confirmation:button:click", ->
        App.request "profile:send:email:confirmation", ->
          App.vent.trigger "show:alert",
            type: "success"
            content: "Отправлено письмо для подтверждения"

      view.on "change:password:button:click", ->
        App.request "profile:send:new:password", ->
          App.vent.trigger "show:alert",
            type: "success"
            content: "Отправлено письмо с новым паролем"

      view

    
