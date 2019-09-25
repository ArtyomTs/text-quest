class Frame < ApplicationRecord
  belongs_to :survey
  has_many :options

  validates :survey, :title, presence: true

end
