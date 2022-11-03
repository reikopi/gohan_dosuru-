class News < ApplicationRecord
  belongs_to :group
  belongs_to :member
end
