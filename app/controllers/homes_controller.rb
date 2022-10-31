class HomesController < ApplicationController
  before_action :correct_user

  def top
  end

  def schedules
    @my_schedules = MySchedule.all
  end

  def schedule_details
    @my_schedule = MySchedule.all
  end

  private

  def correct_user
    if current_member&.group_id.present?

    elsif current_member
      redirect_to members_success_path
    end
  end
end
