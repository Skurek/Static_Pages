class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])      #wyszukiwanie po id i wyswietlanie uzytkownika
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Witamy na stronie!"
      redirect_to @user
    else

      render 'new'

    end
  end


  def index
    @users = User.all
  end
end
