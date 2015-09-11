class BoardsController < ApplicationController
  include ApplicationHelper
  layout 'board'

  def show
    if mobile_devise?
      return render "boards/mobile_devise", layout: "mobile"
    end

    return render :widget_not_found unless params[:widget]
    session[:widget] = params[:widget]
    @widget = Widget.find_by_uid session[:widget]
    return render :widget_not_found if @widget.nil?

    
    return render :login unless session[:reviewer_id]
    return render json: {widget: @widget}

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