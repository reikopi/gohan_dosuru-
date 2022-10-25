class MySchedulesController < ApplicationController
  def index
    @my_schedules = Myschedule.all
  end

  def new
  end

  def create
    @my_schedule = Myschedule.new
    @my_schedule.save
    redirect_to my_schedules_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
