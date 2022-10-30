class Group < ApplicationRecord

  has_many :members, dependent: :destroy
  has_many :shares, dependent: :destroy

end
