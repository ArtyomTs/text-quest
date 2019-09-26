class GameSession < ApplicationRecord
  belongs_to :survey
  belongs_to :frame

  validates :survey, presence: true
end
