class ConstraintsController < ApplicationController
  load_and_authorize_resource   :diet
  load_and_authorize_resource   :course, through: :diet
  load_and_authorize_resource   :constraint, through: :course
  respond_to      :json

  def index
    respond_with          @constraints
  end

  def show
    respond_with          @constraint
  end
  def create
    @constraint           = @course.constraints.create sanitize_params
    respond_with          @constraint, location: nil
  end
  def update
    @constraint.update    sanitize_params.except :course_id
    respond_with          @constraint
  end

  def destroy
    @constraint.destroy
    respond_with          json: 'ok'
  end

  private
    def sanitize_params
      params.permit [ :course_id, :component_type_id, :minimum_value, :maximum_value ]
    end
end
