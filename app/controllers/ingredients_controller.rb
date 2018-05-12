class IngredientsController < ApplicationController
  load_and_authorize_resource   :meal
  load_and_authorize_resource   :plate,       through: :meal
  load_and_authorize_resource   :ingredient,  through: :plate
  respond_to                    :json

  def index
    respond_with          @ingredients
  end

  def show
    respond_with          @ingredient
  end
  def create
    @ingredient           = @plate.ingredients.create sanitize_params.except :plate_id
    respond_with          @ingredient, location: nil
  end
  def update
    @ingredient.update    sanitize_params.except :plate_id
    respond_with          @ingredient
  end

  def destroy
    @ingredient.destroy
    respond_with          json: 'ok'
  end

  private
    def sanitize_params
      params.permit [ :plate_id, :food_id, :quantity ]
    end
end
