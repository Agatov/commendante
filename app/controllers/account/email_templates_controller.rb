class Account::EmailTemplatesController < AccountsController
  def show
    @email_template = current_user.account.widget.email_template
  end

  def update
    @email_template = current_user.account.widget.email_template

    if @email_template.update_attributes email_template_params
      render :show
    else
      render json: {status: :error}
    end
  end

  private

  def email_template_params
    params.require(:email_template).permit(:subject, :body)
  end
end