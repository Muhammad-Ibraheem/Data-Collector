class SessionsController < ApplicationController
def new

end

def create
@user = User.find_by(username: params[:username])
if !!@user && @user.authenticate(params[:password])
  session[:user_id] = @user.id
  redirect_to root_path
else
  redirect_to login_path, notice: "something went wrong!"
end
end

def destroy
session[:user_id] = nil
flash[:success] = "You have logged out"
redirect_to login_path
end

def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end
  private

  def auth
    request.env['omniauth.auth']
  end
end
