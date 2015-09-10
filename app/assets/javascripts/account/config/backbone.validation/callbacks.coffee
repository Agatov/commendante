_.extend(Backbone.Validation.callbacks, {
  valid: (view, attr, selector) ->
    $(view.el).find("[name=#{attr}]").removeClass("invalid")
    $(view.el).find(".input-block.#{attr} .validation-error").hide().text('')

  invalid: (view, attr, error, selector) ->
    $(view.el).find("[name=#{attr}]").addClass("invalid")
    $(view.el).find(".input-block.#{attr} .validation-error").show().text error
});