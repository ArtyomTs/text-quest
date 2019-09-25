class Frame < ApplicationRecord
  belongs_to :survey
  has_many :options

  validates :survey, :title, :code, presence: true
  validates :code, uniqueness: { scope: :survey_id }
end
