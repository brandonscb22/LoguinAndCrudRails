class SessionsController < ApplicationController
  def new
    @session = Session.new
    render layout: false
  end
  def create
    @time_init = DateTime.now
    @time_end = @time_init + 30.minutes
    @user = params[:session][:user]
    @password = params[:session][:password]
    @user_exist = User.find_by(username: @user)
    @session = Session.new(:user_id => @user_exist.id, :time_init => @time_init, :time_end => @time_end )
    @session.save
    if @user_exist
      @encrypted = @user_exist.encrypted_password
      @salt = @user_exist.salt
      @validate_password = BCrypt::Engine.hash_secret(@password, @salt)
      if @validate_password == @encrypted
        @session_act = @session.id
        cookies.delete :key
        cookies[:key] = @session_act
        redirect_to home_path
      else
        render json: 'clave erronea'
        # Clave Erronea
      end
    else
      render json: 'El usuario no existe'
      # Usuario no existe
    end
  end
  def destroy
    cookies.delete :key
    $session = nil
    redirect_to root_path

  end

  private
  def session_params
    params.require(:session).permit(:user,:time_init => @time_init,:time_end => @time_end)
  end
end
