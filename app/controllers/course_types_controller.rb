class CourseTypesController < ApplicationController
  load_and_authorize_resource
  respond_to      :json

  def index
    respond_with @course_types
  end

  def show
    respond_with @course_type
  end
end
