class Group < ApplicationRecord

  has_many :members, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :my_schedules, through: :members

# グループ作成画面／参加画面のバリデーション
  validates :group_name, presence: true
  validates :group_code, presence: true
  validates :password, presence: true

end
