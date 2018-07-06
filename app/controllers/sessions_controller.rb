class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to  "/#{current_user.username}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
