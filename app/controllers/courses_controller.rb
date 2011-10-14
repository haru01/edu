class CoursesController < ApplicationController
  respond_to :json
  def index
    respond_with(@courses = Course.all)
  end
end
