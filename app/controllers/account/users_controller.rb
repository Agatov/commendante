class Account::UsersController < AccountsController
  def index
    @users = current_user.account.users.order("role, name asc")
  end

  def show 
    @user = User.find params[:id]
  end

  def create
    @user = current_user.account.users.build user_params
    @user.active = false
    
    password = @user.generate_password

    if @user.save
      UserMailer.user_invited(@user, password).deliver
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

  def resend_invite
    @user = User.find params[:id]
    password = @user.generate_password
    if @user.save
      render :show
    else
      render json: {status: :error}
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end
end