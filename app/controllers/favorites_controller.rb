class FavoritesController < ApplicationController

  # 登録されたスケジュールにOKする
  def create
    ## OKするスケジュールを見つける
    my_schedule = MySchedule.find(params[:my_schedule_id])
    ## OKをつける
    favorite = current_member.favorites.new(my_schedule_id: my_schedule.id)
    ## OKが保存されたら
    favorite.save
    ## スケジュール詳細画面(１日のグループメンバーのスケジュールを共有）へ行く
    redirect_to members_schedule_details_path(format: my_schedule.start_date)
  end

  #OKしたスケジュールからOKを削除する
  def destroy
    ## OKを削除するスケジュールを見つける
    my_schedule = MySchedule.find(params[:my_schedule_id])
    ## OKをつけたスケジュールを探す
    favorite = current_member.favorites.find_by(my_schedule_id: my_schedule.id)
    ## OKを削除する
    favorite.destroy
    ## スケジュール詳細画面(１日のグループメンバーのスケジュールを共有）へ行くs
    redirect_to members_schedule_details_path(format: my_schedule.start_date)
  end

end
