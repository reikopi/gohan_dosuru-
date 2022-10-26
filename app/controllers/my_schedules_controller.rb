class MySchedulesController < ApplicationController
  def index
    @my_schedules = MySchedule.all
    @my_schedule = MySchedule.new
  end

  def new
  end

  def create
    @my_schedule = MySchedule.new(my_schedule_params)
    if @my_schedule.save
      redirect_to my_schedule_path(@my_schedule.id)
    else
    render index
    end
  end

  def show
    @my_schedule = MySchedule.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def my_schedule_params
    params.permit(:start_date, :morning_select, :lunch_select, :dinner_select, :supplement)
  end


end
