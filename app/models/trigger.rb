require 'json'

class Trigger < ApplicationRecord
  belongs_to :frame
  validates :frame, presence: true


  def get_next_frame(session)
    raise NotImplementedError
  end

  def conditions_hash
    @conditions_hash ||= JSON.parse(self.condition).with_indifferent_access
  end

end
