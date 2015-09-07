@AccountApp.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.TableRowView extends App.Views.ItemView
    template: "users/list/templates/table_row"
    tagName: "tr"

    onRender: ->
      $(@el).addClass("inactive") unless @model.get("active")

    events:
      "click": -> @trigger "user:click", @model


  class List.TableView extends App.Views.CompositeView
    template: "users/list/templates/table"
    className: "users-table"
    tagName: "table"
    childView: List.TableRowView
    childViewContainer: "tbody"
    childViewEventPrefix: "list"