class Group < ApplicationRecord

  has_many :members, dependent: :destroy
  has_many :news, dependent: :destroy
end
