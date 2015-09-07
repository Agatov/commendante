@AccountApp.module "OffersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.TableRowView extends App.Views.ItemView
    template: "offers/list/templates/table_row"
    tagName: "tr"


  class List.TableView extends App.Views.CompositeView
    template: "offers/list/templates/table"
    className: "offers-table"
    tagName: "table"
    childView: List.TableRowView
    childViewContainer: "tbody"
    childViewEventPrefix: "list"