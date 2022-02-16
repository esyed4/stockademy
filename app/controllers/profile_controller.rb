class ProfileController < ApplicationController
  def index
    parameters = user_params
    Rails.logger.debug "user: #{parameters.inspect}"
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.permit(:username, :email)
  end

end
