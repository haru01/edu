class CoursesController < ApplicationController
  respond_to :json
  def index
    respond_with(@courses = Course.order("from_date"))
  end
end
