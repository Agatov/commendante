class ApiController < ApplicationController

  before_action :cors_set_access_control_headers

  def widget
    @widget = Widget.find_by_uid params[:widget]
    unless @widget
      return render json: {status: :error, message: "widget with id #{params[:widget]} was not found"}
    end
  end

  def reviews
    @widget = Widget.find_by_uid params[:widget]
    unless @widget
      return render json: {status: :error, message: "widget with id #{params[:widget]} was not found"}
    end
    @reviews = @widget.reviews.confirmed.with_tariff_limit(@widget.account).order("id desc")
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = "1728000"
  end

end