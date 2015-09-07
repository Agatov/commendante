@AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model
    url: "/account/users"

    defaults: 
      role: "moderator"

    validation:
      email: [
        { 
          required: true
          msg: 'Это поле обязательно для заполнения'
        },
        {
          pattern: 'email'
          msg: 'Введите валидный email'
        }
        
      ]

  class Entities.UsersCollection extends Entities.Collection
    model: Entities.Review
    url: "/account/users"

  API = 

    getNewUser: ->
      new Entities.User

    getUsers: (cb) ->
      users = new Entities.UsersCollection
      users.fetch
        success: ->
          App.reqres.setHandler 'entities:users:loaded', ->
            users

          cb users

      users

  App.reqres.setHandler "entities:users", (cb) ->
    API.getUsers cb

  App.reqres.setHandler "entities:user:new", ->
    API.getNewUser()