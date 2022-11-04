class MySchedule < ApplicationRecord

  belongs_to :member


  def self.search_schedule(date)
    self.where(start_date: date)

  end
end
