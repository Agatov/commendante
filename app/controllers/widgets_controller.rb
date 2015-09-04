class WidgetsController < ApplicationController
  layout "widget"

  def show
    #render json: {path: ActionController::Base.helpers.asset_path("widget.js")}
  end
end