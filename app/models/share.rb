class Share < ApplicationRecord

  belongs_to :group
  has_many :my_schedules, dependent: :destroy

end
