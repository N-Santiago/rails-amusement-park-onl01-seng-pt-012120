class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), :alert => "You Just Signed Up"
    else
      render 'new', :alert => "Please Fill In All Forms"
    end
  end

  def show
    return redirect_to root_path unless logged_in?
    @user = User.find_by(id: params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end
