class FavoritesController < ApplicationController

  def create
    # いいねするスケジュールを見つける
    my_schedule = MySchedule.find(params[:my_schedule_id])
    # いいねをつける
    favorite = current_member.favorites.new(my_schedule_id: my_schedule.id)
    # いいねが保存されたら
    favorite.save
    # 共有詳細ページに戻る
    redirect_to members_schedule_details_path
  end

  def destroy
    # スケジュールを見つける
    my_schedule = MySchedule.find(params[:my_schedule_id])
    # いいねをつけたスケジュールを探す
    favorite = current_member.favorites.find_by(my_schedule_id: my_schedule.id)
    # いいねを削除する
    favorite.destroy
    # 共有詳細ページへ戻る
    redirect_to members_schedule_details_path
  end

end
