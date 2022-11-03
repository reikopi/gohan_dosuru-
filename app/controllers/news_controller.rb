class NewsController < ApplicationController
  def create
    @news = News.new(news_params)
    #homesコントローラーで新規お知らせ登録画面のボタンをクリックされると
    @news.save
    ##お知らせが登録される。
    redirect_to members_schedules_path
    ##お知らせ登録後は、schedules.html（スケジュール共有）へ戻る
  end


  private
  def news_params
    params.require(:news).permit(:title, :message)
  end
end
