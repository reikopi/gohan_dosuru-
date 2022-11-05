class News < ApplicationRecord
  belongs_to :group
  belongs_to :member

  # validates :title, presence: true
  # validates :message, presence: true

end
