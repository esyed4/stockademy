class PortfolioController < ApplicationController
  before_action :user_auth

  def index
    if user_signed_in?
      @user = current_user
      @portfolios = @user.portfolios
    end

  end

  def show
  end

  def new
  end
end
