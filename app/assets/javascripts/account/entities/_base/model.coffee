AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Model extends Backbone.RelationalModel

    # Метод помечает модель как удаленную для Rails NestedAttributes, allow destroy
    markAsDestroyed: ->
      @set "_destroy", true

    removeDestroyedMark: ->
      @unset "_destroy"