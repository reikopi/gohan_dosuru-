class HomesController < ApplicationController
  before_action :correct_user
  before_action :set_group, only: [:schedules, :schedule_details]

  def top
  end

  def schedules
    #お知らせ一覧表示（５件表示後は次のページへ・ページネーション）
    # @news = News.page(params:[page]).per(5)
    @news_all = @group.news.page(params[:page]).per(5)
    #お知らせ投稿機能
    ##お知らせのcreateはnewsコントローラーへ記載
    @news = current_member.news.build # has_many -> news.build
    #@news = current_member.build_news # has_one -> build_news
    #みんなのスケジュール表示（月毎）
    @my_schedules = @group.my_schedules
  end




#以下不安しかないので質問する。
  def schedule_details
    #特定の日付を探す
    # date = MySchedule.find(start_date)
    ##同じ日で登録されたグループ内のスケジュールを全て表示する
    # @my_schedules = MySchedule.where(start_date: same)
    #一旦、他の機能を作成するのに全ての投稿を表示しておく
    @my_schedules = @group.my_schedules
  end

  private

  def correct_user
    if current_member&.group_id.present?

    elsif current_member
      redirect_to members_success_path
    end
  end

  def news_params
    params.require(:news).permit(:title, :message)
  end

  private


  def set_group
    @group = current_member.group
  end



end
