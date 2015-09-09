class Account::ProfilesController < AccountsController
  def show
    @profile = current_user
  end

  def update
    @profile = current_user

    if @profile.update_attributes profile_params
      render :show
    else
      render json: {status: :error}
    end
  end


  def send_email_confirmation
    UserMailer.email_confirmation(current_user).deliver_later
    render json: {status: :ok}
  end

  def send_new_password
    @profile = current_user
    @profile.generate_change_password_token
    @profile.save
    UserMailer.password_change(@profile).deliver_now
    render json: {status: :ok}
  end

  private

  def profile_params
    params.require(:profile).permit(:name)
  end
end