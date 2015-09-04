@AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Widget extends Entities.Model
    url: "/account/widget"
    idAttribute: 'uid'



  API = 

    setWidget: (widget) ->
      new Entities.Widget widget

  App.reqres.setHandler "set:widget", (widget) ->
    API.setWidget widget