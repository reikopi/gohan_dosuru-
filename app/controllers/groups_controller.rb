class GroupsController < ApplicationController
  before_action :member_logged_in?

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    # グループを作成した人は自動的に管理者とする
    @group.admin_member_id = current_member.id
    # binding.pry
    if @group.save
      current_member.update(group_id: @group.id)
    # グループのスケジュール共有ページへいく
      redirect_to members_schedules_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @group_members = GroupMember.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def 退会メソッド
    if current_member.group.admin_member_id == current_member.id
      current_member.group.admin_member_id = nil
    end

    current_member.group_id = nil

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
