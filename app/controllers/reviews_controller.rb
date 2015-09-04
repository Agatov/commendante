class ReviewsController < ApplicationController

  def index
    @site = Site.find_by_url params[:site_url]
    @reviews = @site.reviews.where(moderated: true).order("id desc")
    session[:site_id] = @site.id
    session[:site_url] = @site.url

    if session[:user_id]
      @user = User.find session[:user_id]
    end
    
  end

  def create
    @review = Site.find(session[:site_id]).reviews.build review_params
    @review.user_id = session[:user_id]
    @review.save
    render json: {status: :success}

  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :positive)
  end

end