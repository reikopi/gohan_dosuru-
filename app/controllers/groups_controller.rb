class GroupsController < ApplicationController
  before_action :member_logged_in? #メンバーログインしていない場合、不可

  def new # 新規グループ作成の入力画面を表示
    @group = Group.new
  end

  def create # newで入力した値に応じて、新規グループの作成
    @group = Group.new(group_params)
    # グループを作成した人は自動的に管理者とする
    @group.admin_member_id = current_member.id
    if @group.save #グループが作成できたら
      current_member.update(group_id: @group.id)
    # グループのスケジュール共有ページへいく
      redirect_to members_schedules_path, notice: 'グループを作成しました'
    else #グループ作成ができなかったら
      render :new #新規グループ作成の入力画面へ戻る
    end
  end

  def join # 既存グループに参加する入力画面の表示
  end

  # 修正する
  def current_member_join # joinで入力した値に応じて、ログインしたメンバーをグループに参加させる
    @group = Group.find_by(group_code: params[:group_code], password: params[:password])

    if @group.present?
      # グループが見つかった場合
      ## ログインしているメンバーが、選択したグループに加入する
       current_member.update(group_id: @group.id)
       redirect_to members_schedules_path, notice: 'グループに参加しました'
    else
      # グループが見つからなかった場合
      ## グループ加入画面に遷移する
      render :join
    end
  end

  def show
    #現在参加しているグループの情報を探す
    @group = current_member.group
    #グループのメンバーを探す
    @members = Member.where(group_id: current_member.group)
  end

  def edit
  end

  def update
    #現在参加しているグループの情報を探す
    @group = current_member.group
    @group.update(password: params[:group][:password])
    redirect_to group_path
  end

  def destroy
  end

  def withdrawal
    # グループ退会
    # 退会するmemberがadminだった場合
    if current_member.group.admin_member_id == current_member.id
    # groupのadmin_member_id（管理者）を不在にする(そして誰もグループには入れなくなる)
      current_member.group.admin_member_id = nil
      redirect_to members_success_path
    end
    # 退会するmemberがadmin以外の場合
    # memberが持っていたgroup_idをカラにする
    current_member.update(group_id: nil)
    # current_member.group_id = nil
    redirect_to members_success_path

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
