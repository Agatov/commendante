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

  def change_email

  end

  def change_password

  end

  private

  def profile_params
    params.require(:profile).permit(:name)
  end
end