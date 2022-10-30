class MySchedulesController < ApplicationController
  def index
    # 他人のデータまで表示されるので、memberと紐づける必要あり
    @my_schedules = current_member.my_schedules
    @my_schedule = MySchedule.new
  end

  def new
  end

  def create
    @my_schedule = MySchedule.new(my_schedule_params)

    if @my_schedule.save!
      redirect_to my_schedule_path(@my_schedule.id)
    else
      render :index
    end
  end

  def show
    @my_schedule = MySchedule.find(params[:id])
    @member = current_member
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def my_schedule_params
      params.require(:my_schedule).permit(:start_date, :morning_select, :lunch_select, :dinner_select, :supplement)
    end
end
