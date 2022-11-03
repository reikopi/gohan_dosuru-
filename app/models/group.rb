class Group < ApplicationRecord

  has_many :members, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :my_schedules, through: :members
end
