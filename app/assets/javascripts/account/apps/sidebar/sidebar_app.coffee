@AccountApp.module "SidebarApp", (SidebarApp, App, Backbone, Marionette, $, _) ->

  API =

    show: ->
      SidebarApp.Show.Controller.show()

  SidebarApp.on 'start', ->
    API.show()
