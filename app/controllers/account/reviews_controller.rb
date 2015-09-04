class Account::ReviewsController < AccountsController
  def index
    if params[:type]
      case params[:type]
        when "new" then moderated = nil
        when "confirmed" then moderated = true
        when "rejected" then moderated = false
        else moderated = nil
      end
      @reviews = current_user.account.widget.reviews.where(moderated: moderated).includes(:reviewer).order("id desc")
    else
      @reviews = current_user.account.widget.reviews.includes(:reviewer).order("id desc")
    end
  end

  def show
    @review = Review.find params[:id]
  end

  def update
    @review = Review.find params[:id]

    if @review.update_attributes review_params
      render :show
    else
      # ОЛОЛО, даешь 500
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    render :show
  end

  private 

  def review_params
    params.require(:review).permit(:moderated)
  end
end