class GroupsController < ApplicationController
  before_action :member_logged_in? #メンバーログインしていない場合、不可

  # 新規グループ作成の入力画面を表示
  def new
    @group = Group.new
  end

  # newで入力した値に応じて、新規グループの作成
  def create
    @group = Group.new(group_params)
    ## グループを作成した人は自動的に管理者とする
    @group.admin_member_id = current_member.id
    ## グループが作成できたら、お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面へ行く
    if @group.save
      current_member.update(group_id: @group.id)
      redirect_to members_schedules_path, notice: 'グループを作成しました'
    ## グループの作成ができなかった場合、新規グループ作成の入力画面へ行く
    else
      render :new
    end
  end

  # 既存グループに参加する画面の表示
  def join
  end

  # joinで入力した値に応じて、既存グループに参加させる
  def current_member_join
    @group = Group.find_by(group_code: params[:group_code], password: params[:password], deleted: false)

    ## グループが見つかった場合、ログインしているメンバーが、選択したグループに加入し、
    ## お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面へ行く
    if @group.present?
       current_member.update(group_id: @group.id)
       redirect_to members_schedules_path, notice: 'グループに参加しました'
    ##グループが見つからなかった場合、既存グループに参加する画面へ行く
    else
      render :join
    end
  end

  #参加しているグループの情報画面を表示する
  def show
    ## 現在参加しているグループの情報を探す
    @group = current_member.group
    ## グループに参加しているメンバーを探す
    @members = Member.where(group_id: current_member.group)
  end


  #グループのパスワードを更新する（グループ管理者のみの機能）
  def update
    #現在参加しているグループの情報を探す
    @group = current_member.group
    @group.update(password: params[:group][:password])
    ##更新した場合、参加しているグループの情報画面へ行く
    redirect_to group_path, notice: 'パスワードを変更しました'
  end

  #グループの退会
  def withdrawal

    ## 退会するメンバーが管理者だった場合
    if current_member.group.admin_member_id == current_member.id
    ### グループのdeleted(グループが消されているかどうか)カラムのステータスをTRUEにし、消したこととする
    ### 他のグループメンバーもgroup_idをカラにし、グループから強制的に退会させる
      current_member.group.update(deleted: true)

      @members = Member.where(group_id: current_member.group).update(group_id: nil)
    end
    ## 退会するメンバーが管理者だった場合の処理が済んだ後
    ### memberが持っていたgroup_idをカラにする
    current_member.update(group_id: nil)

    ### 退会後、グループ作成画面へ行く
    redirect_to members_success_path, alert: 'グループを退会しました'

  end

  private
  def group_params
    params.require(:group).permit(:group_name, :group_code, :password)
  end


  # メンバーログインしていない場合に、トップページへリダイレクトするためのアクション
  def member_logged_in?
    redirect_to root_path if !current_member
  end
end
