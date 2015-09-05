$ ->

window.validateReview = ->
  data = getData()

  if data.content.length == 0
    showContetNotice()
    window.contentInvalid = true
  else
    window.contentInvalid = false
    

  if data.rate == undefined
    showRateNotice()
    window.rateInvalid = true
  else
    window.rateInvalid = false

  return false if contentInvalid or rateInvalid
  true



window.showContetNotice = ->
  notice = document.createElement("div")
  $(notice).addClass("notice").addClass("content-notice").text("Отзыв без текста - не отзыв! Напишите хотя бы несколько слов.")
  $("body").append notice

  positionContentNotice(notice)

  $(notice).show().animate({opacity: 1}, 300)

  $(window).on "resize", -> positionContentNotice(notice)

window.showRateNotice = ->
  notice = document.createElement("div")
  $(notice).addClass("notice").addClass("rate-notice").text("Отзыв без оценки - не отзыв! Поставьте столько звезд, сколько не жалко ;)")
  $("body").append notice

  positionRateNotice(notice)

  $(notice).show().animate({opacity: 1}, 300)

  $(window).on "resize", -> positionRateNotice(notice)


window.positionContentNotice = (notice) ->
  textarea = $("textarea")
  $(".content-notice").css "top", (textarea.offset().top + ((textarea.height() + 30) / 2) - ($(notice).height() + 30) / 2)
  $(".content-notice").css "left", (textarea.offset().left + textarea.width() + 40) - 15

window.positionRateNotice = (notice) ->
  stars = $(".stars")
  $(".rate-notice").css "top", (stars.offset().top + stars.height() / 2) - ($(notice).height() + 30) / 2
  left = (stars.offset().left - 20) - ($(notice).width() + 30) + 15
  left = 0 if left < 0
  $(".rate-notice").css "left", left

window.hideContentNotice = ->
  $(".content-notice").animate({opacity: 0}, 300, -> $(@).remove())

window.hideRateNotice = ->
  $(".rate-notice").animate({opacity: 0}, 300, -> $(@).remove())