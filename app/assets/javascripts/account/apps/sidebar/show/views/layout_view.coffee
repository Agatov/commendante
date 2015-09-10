@AccountApp.module "SidebarApp.Show", (Show, App, Backbone, Marionette, $, _) ->


  class Show.LayoutView extends App.Views.LayoutView
    template: "sidebar/show/templates/layout"
    className: "sidebar"

    events: ->
      "click li": "handleLinkClick"

    handleLinkClick: (e) ->

      if $(e.target).attr "trigger"
        $(@el).find("li").removeClass "active"
        $(e.target).addClass "active"

        @trigger "navigation:link:click", {trigger: $(e.target).attr "trigger"}


    refreshReviewsStats: ->
      $(@el).find("span.reviews-count").text "(#{@model.get('reviews_count')})"
      $(@el).find("span.new-reviews-count").text "(#{@model.get('new_reviews_count')})"
      $(@el).find("span.confirmed-reviews-count").text "(#{@model.get('confirmed_reviews_count')})"
      $(@el).find("span.rejected-reviews-count").text "(#{@model.get('rejected_reviews_count')})"

    onRender: ->
      $(@el).find(".sidebar-container").perfectScrollbar()