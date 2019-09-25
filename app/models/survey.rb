class Survey < ApplicationRecord
  validates :title, presence: true

  has_many :frames
  belongs_to :start_frame, class_name: 'Frame', inverse_of: 'survey', optional: true
end
