class ComponentTypesController < ApplicationController
  load_and_authorize_resource
  respond_to      :json

  def index
    respond_with @component_types
  end

  def show
    respond_with @component_type
  end
end
