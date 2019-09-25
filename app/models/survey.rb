class Survey < ApplicationRecord
  validates :title, presence: true

  belongs_to :start_frame, class_name: 'Frame'
  validates :start_frame, presence: true
end
