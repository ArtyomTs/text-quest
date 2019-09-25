class Frame < ApplicationRecord
  belongs_to :survey
  validates :survey, :title, presence: true

end
