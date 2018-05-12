class MealsController < ApplicationController
  load_and_authorize_resource
  respond_to                    :json

  def index
    respond_with          @meals
  end

  def show
    respond_with          @meal
  end
  def create
    @meal                 = current_user.meals.create sanitize_params
    respond_with          @meal, location: nil
  end
  def update
    puts sanitize_params
    @meal.update          sanitize_params.except(:diet_id)
    respond_with          @meal
  end

  def destroy
    @meal.destroy
    respond_with          json: 'ok'
  end

  private
    def sanitize_params
      params.permit [ :name, :diet_id ]
    end
end
