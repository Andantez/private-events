# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_login, only: %i[index show]
  def index
    @users = User.all
    @events = Event.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Private Events #{@user.username}"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @upcomming_pagination = current_user.events.upcomming_events.paginate(page: params[:page],
                                                                          per_page: 4)
    @past_pagination = current_user.events.past_events.paginate(page: params[:page],
                                                                     per_page: 4)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end
end
