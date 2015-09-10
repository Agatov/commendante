@AccountApp.module "UsersApp.User", (User, App, Backbone, Marionette, $, _) ->

  User.Controller = 

    save: (user, view, cb) ->
      user.save null,
        success: (model, response, options) ->
          cb(model) if cb
        
        error: (model, xhr, options) ->
          errors = (JSON.parse(xhr.responseText)).user
          if errors.email
            Backbone.Validation.callbacks.invalid(view, "email", errors.email[0], "name")


    delete: (user, cb) ->
      user.destroy
        success: ->
          cb()