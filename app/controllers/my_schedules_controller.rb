class MySchedulesController < ApplicationController

  # 自分のスケジュールカレンダー画面／自分のスケジュール登録画面を表示
  def index
    ## 自分のスケジュールのみ取得
    @my_schedules = current_member.my_schedules
    ## スケジュールの新規登録画面
    @my_schedule = MySchedule.new
  end

  # newで入力した値に応じて、自分のスケジュールの新規登録をする
  def create
    @my_schedule = MySchedule.new(my_schedule_params)
    @my_schedule.member_id = current_member.id
    ## スケジュールが登録されれば、登録したスケジュールの詳細画面へ行く
    if @my_schedule.save
      redirect_to my_schedule_path(@my_schedule.id)
    else
    ## スケジュールが登録されなかった場合、自分のスケジュールカレンダー／自分のスケジュール登録画面へ戻る
      render :index
    end
  end

  # 登録したスケジュールの詳細を表示
  def show
    @my_schedule = MySchedule.find(params[:id])
    @member = current_member
  end

  # 登録したスケジュールの編集画面を表示
  def edit
    @my_schedule = MySchedule.find(params[:id])
  end

  # editで編集した値に応じて、スケジュールの更新をする
  def update
    @my_schedule = MySchedule.find(params[:id])
    ## スケジュールの更新ができたら、登録したスケジュールの詳細画面へ行く
    @my_schedule.update(my_schedule_params)
    redirect_to my_schedule_path(@my_schedule.id)
  end

  # 登録したスケジュールの削除をする
  def destroy
    @my_schedule = MySchedule.find(params[:id])
    ## スケジュールを削除した場合、自分のスケジュールカレンダー／自分のスケジュール登録画面へ戻る
    @my_schedule.destroy
    redirect_to my_schedules_path
  end

  private
    def my_schedule_params
      params.require(:my_schedule).permit(:start_date, :morning_select, :lunch_select, :dinner_select, :supplement)
    end
end
