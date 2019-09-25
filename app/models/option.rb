class Option < ApplicationRecord
  belongs_to :frame

  validates :text, :code, :frame, presence: true
  validates :code, uniqueness: { scope: :frame_id, message: 'You need an unique option code to navigate.' }
end
