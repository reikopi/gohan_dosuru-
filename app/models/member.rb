class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :group, optional: true
  has_many :my_schedules, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :favorites, dependent: :destroy




end
