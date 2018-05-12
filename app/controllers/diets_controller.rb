class DietsController < ApplicationController
  load_and_authorize_resource
  respond_to                    :json

  def index
    respond_with          @diets
  end

  def show
    respond_with          @diet
  end
  def create
    @diet                 = current_user.diets.create sanitize_params
    respond_with          @diet, location: nil
  end
  def update
    @diet.update          sanitize_params
    respond_with          @diet
  end

  def destroy
    @diet.destroy
    respond_with          json: 'ok'
  end

  private
    def sanitize_params
      params.permit [ :name ]
    end
end
