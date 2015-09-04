@AccountApp.module "Views.Mixins", (Mixins, App, Backbone, Marionette, $, _) ->

  # 
  # Миксин, который позволяет показывать
  # модальные окна с транзишенами (эффект появления и скрытия 
  # при region.show() / region.reset())

  #
  # Идея реализации взята отсюда
  # https://github.com/marionettejs/backbone.marionette/issues/320 
  # Пост автора
  # eschwartz commented on 5 Nov 2013
  #

  class Mixins.ViewTransitions

    # При отображении мы изначально скрываем элемент
    # и отложенно (см. _.defer()) показываем его
    onRender: ->
      $(@el).hide()
      _.defer(_.bind(@transitionIn, @))

    # Переопределение метода View.destroy
    # которое сохраняет родительское цепочку вызвовов
    # и правильно анбиндит все события с вьюхи
    destroy: ->
      parent_destroy = _.bind =>
        Marionette.View.prototype.destroy.call(@)
        @

      @transitionOut ->
        parent_destroy(@)

    onDestroy: ->
      # А этот метод вообще нужен будет?

    transitionIn: ->

    transitionOut: (cb) ->   

  
  class Mixins.TransitionSlide

    transitionIn: ->
      old_left = $(@el).css("left")
      $(@el).css("left", "#{$(document).width()}px")
      $(@el).show()

      $(@el).animate({
        left: old_left
      }, 300)

    transitionOut: (cb) ->   
      $(@el).animate({
        left: "#{-($(".modal").width() + 100)}px"
      }, 300, =>
        $(@el).hide()
        cb()
      )

  class Mixins.TransitionOpacity

    transitionIn: ->
      $(@el).css "opacity", 0
      $(@el).show()
      $(@el).animate({opacity: 1}, 800, "swing")

    transitionOut: (cb) ->
      $(@el).animate({opacity: 0}, 300, "swing", -> 
        cb()
        $(@el).hide()
      )


  class Mixins.TransitionSlideNone

    transitionIn: ->
      old_left = $(@el).css("left")
      $(@el).css("left", "#{$(document).width()}px")
      $(@el).show()

      $(@el).animate({
        left: old_left
      }, 300)

    transitionOut: (cb) ->
      $(@el).hide()