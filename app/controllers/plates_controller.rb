class PlatesController < ApplicationController
  load_and_authorize_resource :meal
  load_and_authorize_resource :plate,  through: :meal
  respond_to      :json

  def index
    respond_with          @plates
  end

  def show
    respond_with          @plate
  end
  def create
    @plate                = @meal.plates.create sanitize_params
    respond_with          @plate, location: nil
  end
  def update
    @plate.update         sanitize_params.except :meal_id
    respond_with          @plate
  end

  def destroy
    @plate.destroy
    respond_with          json: 'ok'
  end

  private
    def sanitize_params
      params.permit :name, :meal_id
    end
end
