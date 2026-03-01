class AuthenticationController < ApplicationController
  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :login, notice: "Registration successful. Please login"
    else
      render :register, status: :unprocessable_entity
    end
  end

  def login; end

  def process_login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to todos_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid username or password"
      render :login, status: :unauthorized
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
