class ComponentsController < ApplicationController
  load_and_authorize_resource :food
  load_and_authorize_resource :component, through: :food
  respond_to      :json

  def index
    respond_with          @components
  end

  def show
    respond_with          @component
  end
  def create
    respond_with          @component = Component.create(sanitize_params), location: nil
  end
  def update
    @component.update    sanitize_params
    respond_with          @component
  end

  def destroy
    @component.destroy
    respond_with          json: 'ok'
  end

  private
    def sanitize_params
      params.permit :food_id, :component_type_id, :value
    end
end
