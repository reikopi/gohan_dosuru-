class NewsController < ApplicationController

  before_action :set_group, only: :create
  def create
    @news = @group.news.build(news_params)
    @news.member_id = current_member.id
    #homesコントローラーで新規お知らせ登録画面のボタンをクリックされると
    if @news.save
    ##お知らせが登録される。
      redirect_to members_schedules_path
    ##お知らせ登録後は、schedules.html（スケジュール共有）へ戻る
    else
      render "homes/schedules"
    end
  end

  def destroy
    @news = News.find(params[:news][:id])
    @news.member_id = current_member.id
    if @news.destroy
    redirect_to members_schedules_path
    else
      render "homes/schedules"
    end
  end


  private

  def news_params
    params.require(:news).permit(:title, :message)
  end

  def set_group
    @group = current_member.group
  end
end
