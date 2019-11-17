class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
