class Account::UsersController < AccountsController
  def index
    @users = current_user.account.users.order("role, name asc")
  end

  def show
    @user = current_user.account.users.build user_params
    password = @user.generate_password

    if @user.save
      UserMailer.user_invited_email(@user.email, password).deliver
      render :show
    else
      render json: {status: :error}
    end
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes user_params
      render :show
    else
      render json: {status: :error}
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    render :show
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end