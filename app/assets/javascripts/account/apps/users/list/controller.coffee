@AccountApp.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller = 

    show: ->
      layoutView = @getLayoutView()
      formView = @getFormView()

      App.request "entities:users", (users) =>
        tableView = @getTableView users

        App.mainRegion.show layoutView
        layoutView.tableRegion.show tableView
        layoutView.formRegion.show formView


    getLayoutView: ->
      view = new List.LayoutView
      view

    getFormView: ->
      view = new List.FormView
        model: App.request "entities:user:new"

      view.on "valid:form:submit", (user) ->
        App.vent.trigger "save:user", user, ->
          view.model = App.request "entities:user:new"
          view.render()
          App.request("entities:users:loaded").add user



      view

    getTableView: (users) ->
      view = new List.TableView
        collection: users

      view