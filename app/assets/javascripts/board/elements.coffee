$ ->

  $("textarea").autogrow()

  $("textarea").on "focus", ->
    hideContentNotice() if contentInvalid

  $(".star").on "mouseover", ->
    hideRateNotice() if rateInvalid

    $(".star").removeClass("lighting")
    $(".star:lt(#{$(@).attr('rate')})").addClass("lighting")

  $(".stars").on "mouseleave", ->
    $(".star").removeClass("lighting")

  $(".star").on "click", ->

    if $(@).hasClass("yellow")
      $(".star").removeClass "yellow"
      $(".stars").removeAttr "rate"
    else
      $(".star:lt(#{$(@).attr('rate')})").addClass("yellow")
      $(".stars").attr("rate", $(@).attr('rate'))