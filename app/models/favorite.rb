class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :my_schedule
end
