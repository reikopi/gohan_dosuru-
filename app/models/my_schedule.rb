class MySchedule < ApplicationRecord

  # belongs_to :member
  # belongs_to :share

  def self.search_schedule(date)
    self.where(start_date: date)
  end
end
