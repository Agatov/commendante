class BoardsController < ApplicationController

  layout 'board'

  def show
    return redirect_to root_path unless params[:widget]
    session[:widget] = params[:widget]
    return redirect_to login_board_path unless session[:reviewer_id]

    @widget = Widget.find_by_uid session[:widget]
    return render :widget_not_found if @widget.nil?

    @reviewer = Reviewer.find session[:reviewer_id]
    @review = Review.find_by_widget_id_and_reviewer_id @widget.id, @reviewer.id
  end

  def login
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def widget_not_found
  end

end