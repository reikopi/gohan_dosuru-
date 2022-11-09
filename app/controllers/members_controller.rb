class MembersController < ApplicationController

  #メンバー情報詳細画を表示
  def show
    @member = current_member
    @group = @member.group
  end

  # メンバーサインイン／ログイン後の画面を表示
  def success
    ## もし管理者がグループを持っていた場合はメンバーサインイン／ログイン後の画面には行かず、
    ## お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面へ行く
    if current_member.group&.admin_member_id == current_member.id
      redirect_to members_schedules_path

    ## もしメンバーがグループに所属（グループIDを所持）していれば、メンバーサインイン／ログイン後の画面には行かず、
    ## お知らせ共有／お知らせ投稿／スケジュール集計グループでの共有画面へ行く
    elsif current_member.group_id != nil
      redirect_to members_schedules_path
    end
  end




end
