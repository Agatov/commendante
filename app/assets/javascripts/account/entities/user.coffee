@AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model
    urlRoot: "/account/users"

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
    model: Entities.User
    url: "/account/users"

  API = 

    getNewUser: ->
      new Entities.User

    getUser: (id, cb) ->
      users = App.request 'entities:users:loaded'
      if users
        user =  users.get(id)
        user.fetch
          success: ->
            cb(user)
      else
        user = new Entities.User({id: id})
        user.fetch
          success: ->
            cb(user)

    getUsers: (cb) ->
      users = new Entities.UsersCollection
      users.fetch
        success: ->
          App.reqres.setHandler 'entities:users:loaded', ->
            users

          cb users

      users

    resendInvite: (user, cb) ->
      request = $.ajax(
        url: "/account/users/#{user.get('id')}/resend_invite"
        method: 'put'
      )

      request.done (msg) ->
        cb() if cb

    sendEmailConfirmation: (cb) ->
      request = $.ajax(
        url: "/account/profile/send_email_confirmation"
        method: "put"
      )

      request.done (msg) ->
        cb() if cb

    sendNewPassword: (cb) ->
      request = $.ajax(
        url: "/account/profile/send_new_password"
        method: "put"
      )

      request.done (msg) ->
        cb() if cb




  App.reqres.setHandler "entities:users", (cb) ->
    API.getUsers cb

  App.reqres.setHandler "entities:user", (id, cb) ->
    API.getUser id, cb

  App.reqres.setHandler "entities:user:new", ->
    API.getNewUser()

  App.reqres.setHandler "entities:user:resend:invite", (user, cb) ->
    API.resendInvite user, cb

  App.reqres.setHandler "profile:send:email:confirmation", (cb) ->
    API.sendEmailConfirmation cb

  App.reqres.setHandler "profile:send:new:password", (cb) ->
    API.sendNewPassword cb

  App.reqres.setHandler "set:profile", (user) ->
    new Entities.User(user)



  