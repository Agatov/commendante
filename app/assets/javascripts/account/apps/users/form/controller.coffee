@AccountApp.module "UsersApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  Form.Controller =

    show: (user_id) ->
      App.request "entities:user", user_id, (user) =>
        console.log user
        layoutView = @getLayoutView user
        formView = @getFormView user

        App.mainRegion.show layoutView
        layoutView.formRegion.show formView

    getLayoutView: (user) ->
      view = new Form.LayoutView
        model: user

      view.on "go:back:button:click", -> App.vent.trigger "show:users"

      view.on "delete:user:button:click", (user) ->
        App.vent.trigger "show:confirm:modal",
          content: "Вы действительно хотите удалить этого пользователя?"
          onConfirm: ->
            App.vent.trigger "delete:user", user, ->
              App.vent.trigger "show:users"
              App.vent.trigger "show:alert",
                type: "success"
                content: "Пользователь был успешно удален"

      view

    getFormView: (user) ->
      view = new Form.FormView
        model: user

      view.on "form:state:changed", (user, element) ->
        App.vent.trigger "save:user", user, ->
          view.fieldUpdated element

      view.on "invite:button:click", (user) ->
        App.request "entities:user:resend:invite", user, ->
          App.vent.trigger "show:alert",
            type: "success"
            content: "Приглашение выслано повторно"

      view
