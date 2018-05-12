class CoursesController < ApplicationController
  load_and_authorize_resource :diet
  load_and_authorize_resource :course, through: :diet
  respond_to              :json

  def index
    respond_with          @courses
  end

  def show
    respond_with          @course
  end
  def create
    @course               = @diet.courses.create sanitize_params
    respond_with          @course, location: nil
  end
  def update
    @course.update        sanitize_params.except :diet_id
    respond_with          @course
  end

  def destroy
    @course.destroy
    respond_with          json: 'ok'
  end

  private
    def sanitize_params
      params.permit :name, :diet_id, :course_type_id
    end
end
