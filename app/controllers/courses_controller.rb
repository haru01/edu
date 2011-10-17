# encoding: utf-8

class CoursesController < ApplicationController
  respond_to :json
  def index
    @courses = Course.order("from_date")
    respond_with(@courses,
                         include: { main_lecturer: { only: :name } },
                         except: [:created_at, :updated_at] )
  end

  def create
    args = JSON.parse(request.body.read.to_s)
    main_lecturer_id = args.delete("main_lecturer_id")
    args.merge! "status" =>  Course::Status["予定"]
    begin
      @course = Course.create!(args)
      @assign = Assign.create!(lecturer_id: main_lecturer_id,
                              course_id: @course.id,
                              role: Assign::Role['主'])
      respond_with(:status => :ok) # TODO
    rescue Exception => e
      raise :not_impelments
    end
  end
end
