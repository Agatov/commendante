$ ->

  GetReview.API.initialize GetReview.WidgetUID, (data) ->
    GetReview.Data = data

    grWidgetButton = document.createElement("div")
    $(grWidgetButton).addClass "gr-widget-button"
    $(grWidgetButton).html "<div class = 'gr-button-reviews-count'>#{GetReview.Data.reviews_count}</div> #{GetReview.Data.reviews_count_text}"

    grOverlay = document.createElement("div")
    $(grOverlay).addClass("gr-overlay")

    grCloseOverlayButton = document.createElement("div")
    $(grCloseOverlayButton).addClass "gr-close-overlay-icon"

    grPanel = document.createElement("div")
    $(grPanel).addClass("gr-widget-panel")

    grPanelContainer = document.createElement("div")
    $(grPanelContainer).addClass "gr-widget-panel-container"

    $("body").append grOverlay
    $("body").append grCloseOverlayButton
    $("body").append grPanel
    $("body").append grWidgetButton

    $(".gr-widget-panel").append grPanelContainer

    if GetReview.Data.reviews_count == 0
      $(".gr-widget-panel").addClass "gr-widget-panel-empty"
      $(".gr-widget-panel-container").append(GetReview.API.renderEmpty(GetReview.Data))
    else
      $(".gr-widget-panel-container").append(GetReview.API.renderReviewsTop(GetReview.Data))
      $(".gr-widget-panel-container").append(GetReview.API.renderReviewsHeader(GetReview.Data))
      $(".gr-widget-panel-container").perfectScrollbar()


      reviewsRoot = document.createElement("div")
      $(reviewsRoot).addClass "gr-reviews"


      $(reviewsRoot).append(GetReview.API.renderReview(reviewData)) for reviewData in GetReview.Data.reviews
      $(".gr-widget-panel-container").append reviewsRoot

    $(grWidgetButton).on "click", -> GetReview.API.showPanel()
    $(grCloseOverlayButton).on "click", -> GetReview.API.hidePanel()
    $(grOverlay).on "click", -> GetReview.API.hidePanel()

GetReview.API = 

  showPanel: ->
    overlay = $(".gr-overlay")
    overlay.css "opacity", 0
    overlay.show()
    overlay.animate({opacity: "0.8"}, 300)

    closeIcon = $(".gr-close-overlay-icon")
    closeIcon.css "top", "-40px"
    closeIcon.css "opacity", "0"
    closeIcon.show()
    closeIcon.animate {top: "30px", opacity: 1}, 300

    panel = $(".gr-widget-panel")
    panel.css("left", "-520px")
    panel.css "opacity", 0
    panel.show()
    panel.animate({"left": "0px", "opacity": 1}, 300)


  hidePanel: ->
    overlay = $(".gr-overlay")
    overlay.animate {opacity: "0"}, 300, -> overlay.hide()

    closeIcon = $(".gr-close-overlay-icon")
    closeIcon.animate {top: "-40px", opacity: 0}, 300, -> closeIcon.hide()

    panel = $(".gr-widget-panel")
    panel.animate {"left": "-520px", "opacity": 0}, 300, -> panel.hide()


  renderEmpty: (data) ->
    """
      <div class ="gr-widget-panel-empty-box">
        <div class = "gr-widget-panel-empty-title">
          Увы, никто еще не написал ни одного отзыва,
          но вы можете быть первым!
        </div>
        <a href = "#{data.review_board_url}"  class = "gr-button" target = "_blank">Написать первый отзыв</a>
      </div>
    """


  renderReviewsTop: (data) ->
    """
      <div class = "gr-widget-top">
        <a href = "#{data.review_board_url}" class = "gr-button" target = "_blank"> Написать свой отзыв </a>
      </div>
    """

  renderReviewsHeader: (data) ->
    """
      <div class ="gr-reviews-header">
        <div class = "gr-reviews-total-rate">
          <div class = "gr-reviews-total-rate-stars #{GetReview.API.getStarsClassByRate(data.average_rate_rounded)}"></div>
        </div>
        <div class = "gr-reviews-total-count">
          #{data.reviews_count} #{data.reviews_count_text} о компании</div>
        <div class = "gr-reviews-company-name">«#{data.company_name}»</div>
      </div>
    """

  renderReview: (data) ->
    """
      <div class = "gr-review">
        <div class = "gr-review-header">
          <div class = "gr-review-author-avatar">
            <img src = "#{data.avatar}">
          </div>

          <div class = "gr-review-author-details">
            <div class = "gr-review-author-name">#{data.username}</div>
            <div class = "gr-review-author-url">
              <a href = "#{data.user_url}" target = "_blank">#{data.user_url}</a>
            </div>

          </div>

          <div class = "gr-review-right">
            <div class ="gr-review-rate-stars #{GetReview.API.getStarsClassByRate(data.rate)}"></div>
            <div class = "gr-review-date">#{data.date}</div>
          </div>

        </div>

        <div class = "gr-review-body">
          #{GetReview.API.decorateText(data.content)}
        </div>
      </div>
    """

  initialize: (widget, cb) ->

    $.get(
      "http://getreview.ru/api/reviews/#{widget}.json",
      (data) ->
        if data.status = "success"
          cb(data)
    )

  getStarsClassByRate: (rate) ->
    switch rate
      when 1 then return "one-star"
      when 2 then return "two-stars"
      when 3 then return "three-stars"
      when 4 then return "four-stars"
      when 5 then return "five-stars"

  decorateText: (str) ->
    lines = str.replace(/[\r\n]+/g, '\n').split("\n")
    "<p>" + lines.join("</p><p>") + "</p>"


