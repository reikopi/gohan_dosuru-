class MembersController < ApplicationController
  # before_action :correct_user

  def show
    @member = current_member
    @group = @member.group
  end

  def success
    # もし管理者がグループを持っていた場合はsuccessページには行かず、スケジュール共有ページへとぶ
    if current_member.group&.admin_member_id == current_member.id
      redirect_to members_schedules_path
      # もしmemberがグループに所属（グループIDを所持）していれば、successページには行かず、スケジュール共有ページへとぶ
    elsif current_member.group_id != nil
      redirect_to members_schedules_path
    end
  end




end
