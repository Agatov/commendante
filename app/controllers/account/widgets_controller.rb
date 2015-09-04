class Account::WidgetsController < AccountsController
  def show
    @widget = current_user.account.widget
  end

  def update
    @widget = current_user.account.widget

    if @widget.update_attributes widget_params
      render :show
    else
      # ололоо 500 ис хиар
    end
  end

  private

  def widget_params
    params.require(:widget).permit(:company_name, :site_url, :email)
  end
end