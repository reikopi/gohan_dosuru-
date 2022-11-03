class MySchedule < ApplicationRecord

  belongs_to :member


  def self.search_schedule(date)
    self.where(start_date: date)

    #スケジュールの日付が同じ　AND 同じグループに所属する人のスケジュール　を探す
    # self.where(start_date: date).where(group_id: current_group.id)
    # self.where(start_date: date) && Member.where(group_id: current_member.group)
  end
end
