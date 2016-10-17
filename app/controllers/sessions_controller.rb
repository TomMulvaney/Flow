class SessionsController < ApplicationController
  before_action :authenticate_user, only: [:home, :profile, :setting]
  before_action :save_login_state, only: [:login, :login_attempt]

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to action: "login"
  end

  def home
  end

  def profile
  end

  def setting
  end

  def login_attempt
    puts "Logging in"
    puts params[:username_or_email]
    puts params[:password]
    authorized_user = User.authenticate(params[:username_or_email],params[:password])
    if authorized_user
      puts "Authorized"
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(action: 'home')
    else
      puts "Unauthorized"
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end
end
