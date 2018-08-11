class UsersController < ApplicationController
  helper UserHelper

  before_action :find_user, only: [:show]

  ## Can see public profiles
  skip_before_action :authenticate_user!, only: [:show]

  def show

  end

  private
    def find_user
      @user = User.find(params[:id])
    end
end
