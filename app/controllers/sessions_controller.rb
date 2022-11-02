class SessionsController < ApplicationController

    def new #render the login form
      if logged_in?
        redirect_to root_path
      end
    end
  
    def create # processing the login form
        @user = User.find_by(email: params[:email])
  
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to root_path
  
        else
          flash[:alert] = "User not found."
          # render :new
          redirect_to signup_path
        end
  
      end
  
      # Loging Out
      def destroy
        session.delete :user_id
        flash[:notice] = 'Logged Out'
        redirect_to login_path
      end
  
  def omniauth
    @user =
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.provider = auth['info']['provider']
      u.password = SecureRandom.hex(15)
    end
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
  
      private
    
      def auth
        request.env['omniauth.auth']
      end
  
    end