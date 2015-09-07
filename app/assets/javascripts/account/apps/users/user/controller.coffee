@AccountApp.module "UsersApp.User", (User, App, Backbone, Marionette, $, _) ->

  User.Controller = 

    save: (user, cb) ->
      user.save null,
        success: ->
          cb()

    delete: (user, cb) ->
      user.destroy
        success: ->
          cb()