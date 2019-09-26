class Trigger < ApplicationRecord
  belongs_to :frame
  validates :frame, presence: true


  def get_next_frame(session)
    raise NotImplementedError
  end

end
