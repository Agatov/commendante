$ ->

  $(document).on "gr:widget:panel:opened", ->
    reachGoal "gr_widget_panel_opened"

window.reachGoal = (goal) ->
  yaCounter.reachGoal goal