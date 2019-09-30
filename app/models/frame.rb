class Frame < ApplicationRecord
  belongs_to :survey
  has_many :options
  has_one :trigger

  validates :survey, :title, :code, presence: true
  validates :code, uniqueness: { scope: :survey_id }

  def check_point?
    self.is_check_point
  end

  def final?
    self.is_final?
  end

  def success?
    self.is_success?
  end

  def get_next_frame(session)
    self.trigger.get_next_frame(session)
  end
end
