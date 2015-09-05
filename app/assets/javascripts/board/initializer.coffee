$ ->

  window.contentInvalid = false
  window.rateInvalid = false

  $.fn.spin.presets.button = {
    lines: 12
    length: 5
    width: 2
    radius: 5
  }

window.getData = ->
  {content: $("textarea").val(), rate: $(".stars").attr("rate")}

window.getStarsClassByRate = (rate) ->
  switch rate
    when 1 then return "one-star"
    when 2 then return "two-stars"
    when 3 then return "three-stars"
    when 4 then return "four-stars"
    when 5 then return "five-stars"



window.decorateText = (str) ->
  lines = str.replace(/[\r\n]+/g, '\n').split("\n")
  "<p>" + lines.join("</p><p>") + "</p>"



