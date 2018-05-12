class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to      :json

  def index
    respond_with          @users
  end

  def show
    respond_with          @user
  end

  def new
    respond_with          @user = User.new
  end
  def create
    #params[:user][:password] = params[:user][:password_confirmation] = "#{SecureRandom.hex(5).upcase}#{SecureRandom.hex(5).downcase}"
    #respond_with          @user = User.new sanitize_params
  end
  def update
    @user.update          sanitize_params.reject :email
    respond_with          @user
  end
  def destroy
    @user.destroy
    respond_with          json: 'ok'
  end

  private
    def sanitize_params
      params.permit       :name, :description, :offset, :limit
    end
end
