class CoursesController < ApplicationController
  respond_to :json
  def index
    @courses = Course.order("from_date")
    respond_with(@courses,
                         include: { main_lecturer: { only: :name } },
                         except: [:created_at, :updated_at] )
  end

  def create
    respond_with(:status => :ok) # TODO
  end
end
