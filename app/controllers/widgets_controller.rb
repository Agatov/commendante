class WidgetsController < ApplicationController
  layout "widget"

  def show
    @widget = Widget.find_by_uid("6c41cacb8f1f64005836")
    #render json: {path: ActionController::Base.helpers.asset_path("widget.js")}
  end
end