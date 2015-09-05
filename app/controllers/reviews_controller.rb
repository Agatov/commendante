class ReviewsController < ApplicationController

  def show
  end

  def create
    @widget = Widget.find_by_uid(session[:widget])
    return render json: {status: :error, msg: "widget not found"} unless @widget

    @review = @widget.reviews.build review_params
    @review.reviewer_id = session[:reviewer_id]
    

    if @review.save
      render :show
    else
      render json: {status: :error}
    end
  end

  def update
    @widget = Widget.find_by_uid(session[:widget])
    return render json: {status: :error, msg: "widget not found"} unless @widget

    @reviewer = Reviewer.find session[:reviewer_id]
    @review = Review.find_by_widget_id_and_reviewer_id @widget.id, @reviewer.id

    if @review.update_attributes review_params
      render :show
    else
      render json: {status: :error}
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rate)
  end

end