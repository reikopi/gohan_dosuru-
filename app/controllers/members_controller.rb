class MembersController < ApplicationController
  before_action :correct_user

  def show
    @member = current_member
  end

  def success

  end

  private

  def correct_user
    # すでにグループに所属していた場合の処理と
    # グループに管理者（グループ作成者）が所属していた時の処理
    if current_member.group&.admin_member_id == current_member.id
      redirect_to members_schedules_path
    end
    # グループ所属なし、グループ退会済みの場合はsuccessページへいく
  end
end
