class HomesController < ApplicationController
  before_action :correct_user
  before_action :set_group, only: [:schedules, :schedule_details]

  # メンバーサインアップ／ログイン前のトップページ
  def top
  end

  # お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面
  def schedules
    ##お知らせ一覧表示（５件表示後は次のページへ・ページネーション）
    ###最新投稿は一番上に来るようにする
    @news_all = @group.news.order("created_at DESC").page(params[:page]).per(5)
    ##お知らせ投稿機能
    ###お知らせのcreateはnewsコントローラーへ記載
    @news = current_member.news.build
    ##グループのスケジュール（月毎集計）表示
    @my_schedules = @group.my_schedules
  end




  #スケジュール詳細画面(１日のグループメンバーのスケジュールを共有）
  def schedule_details
    ##スケジュールカレンダーから直接日付を取得する。
    @day_params = params[:format]
    ## 同じグループに所属する人のスケジュールを取得する
    @my_schedules = @group.my_schedules
  end

  private

  #メンバーログインしており、かつ、グループidを持っているかどうかの確認用アクション
  def correct_user
    if current_member&.group_id.present?
    ##もし、グループidを持っていなかった場合は、メンバーサインイン／ログイン後の画面へ移動する
    elsif current_member
      redirect_to members_success_path
    end
  end

  def news_params
    params.require(:news).permit(:title, :message)
  end

  private

  #現在ログイン中のメンバーが所属するグループのみ表示
  def set_group
    @group = current_member.group
  end



end
