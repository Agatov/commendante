@AccountApp.module "UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  class UsersApp.Router extends Marionette.AppRouter
    appRoutes:
      'users(/)': 'showUsers'
      'users/:user_id/edit': 'showUserForm'

  App.addInitializer ->
    new UsersApp.Router
      controller: API

  API = 

    showUsers: ->
      UsersApp.List.Controller.show()

    showUserForm: (user_id) ->
      UsersApp.Form.Controller.show user_id

    save: (user, view, cb) ->
      UsersApp.User.Controller.save user, view, cb

    delete: (user, cb) ->
      UsersApp.User.Controller.delete user, cb


  App.vent.on "show:users", ->
    App.navigate "users"
    API.showUsers()

  App.vent.on "show:user:form", (user_id) ->
    App.navigate "users/#{user_id}/edit"
    API.showUserForm user_id

  App.vent.on "save:user", (user, view, cb) ->
    API.save user, view, cb

  App.vent.on "delete:user", (user, cb) ->
    API.delete user, cb
