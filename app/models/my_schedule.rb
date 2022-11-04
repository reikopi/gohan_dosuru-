class MySchedule < ApplicationRecord

  belongs_to :member
  has_many :favorites, dependent: :destroy

  def self.search_schedule(date)
    self.where(start_date: date)
  end

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

end
