class ApiController < ApplicationController

  before_action :cors_set_access_control_headers

  def reviews
    @site = Site.find_by_url params[:url]
    unless @site
      return render json: {status: :error, message: "site with url #{params[:url]} was not found"}
    end
    @reviews = @site.reviews.where(moderated: true).order("id desc")
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = "1728000"
  end

end