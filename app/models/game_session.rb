class GameSession < ApplicationRecord
  belongs_to :survey
  belongs_to :frame, optional: true

  validates :survey, presence: true

  before_create :set_start_frame

  def chosen_option_id=(option_id)
    option = find_option option_id
    process_choice(option)
  end

  #TODO implement with event machine
  def choice=(action)
    case action
    when 'restart'
      self.restart
    when 'quit'
      self.quit
    when 'rollback'
      self.rollback
    end
  end

  def restart
    @is_restarted = true
  end

  def quit
    @is_finished = true
  end

  def restarted?
    !!@is_restarted
  end

  def finished?
    !!@is_finished
  end

  def rollback
    self.frame = self.survey.frames.find self.check_point
  end

  def find_last_answer
    last_answer_id = self.answers.last
    Option.find last_answer_id
  end

  private

  def set_start_frame
    self.frame = self.survey.start_frame if self.frame.nil?
    self.check_point = self.survey.start_frame.id
  end

  def find_option(option_id)
    Option.find option_id
  end

  def process_choice(option)
    remember_choice(option)
    next_frame_code = self.frame.get_next_frame(self)
    next_frame = self.survey.frames.find_by!(code: next_frame_code)
    set_current_frame(next_frame)
  end

  def remember_choice(option)
    self.answers << option.id
  end

  def set_current_frame(current_frame)
    self.frame = current_frame
    self.check_point = current_frame.id if current_frame.check_point?
  end
end
