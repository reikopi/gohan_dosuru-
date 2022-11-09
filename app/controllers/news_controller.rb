class NewsController < ApplicationController

  before_action :set_group, only: :create

  #homesコントローラーのschedulesアクションで入力したお知らせを投稿する
  def create
    @news = @group.news.build(news_params)
    @news.member_id = current_member.id
    ## 新規お知らせ投稿が保存された場合、お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面へ行く
    if @news.save
      redirect_to members_schedules_path
    ## お知らせ登録が保存されなかった場合は、お知らせ投稿機能以外のアクションを読み込み、
    ## バリデーションをした上で、お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面へ行く
    else
      @news_all = @group.news.order("created_at DESC").page(params[:page]).per(5)
      @my_schedules = @group.my_schedules
      render "homes/schedules"
    end
  end

  #投稿したお知らせを削除する(投稿したメンバー本人のみ可能)
  def destroy
    @news = News.find(params[:id])
    @news.member_id = current_member.id
    ##投稿したお知らせを削除した場合、お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面へ行く
    if @news.destroy
    redirect_to members_schedules_path
    ##投稿したお知らせを削除できなかった場合、お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面へ行く
    else
      render "homes/schedules"
    end
  end


  private

  def news_params
    params.require(:news).permit(:title, :message)
  end

  # グループに参加していない場合、行けないようにするためのアクション
  def set_group
    @group = current_member.group
  end
end
