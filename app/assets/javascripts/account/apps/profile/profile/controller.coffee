@AccountApp.module "ProfileApp.Profile", (Profile, App, Backbone, Marionette, $, _) ->

  Profile.Controller = 

    save: (profile, cb) ->
      profile.url = "/account/profile"
      profile.save null,
        success: ->
          cb()