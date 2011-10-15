class CoursesController < ApplicationController
  respond_to :json
  def index
    @courses = Course.order("from_date")
    respond_with(@courses,{include: :main_lecturer})
  end
end
