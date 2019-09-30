class DirectJumpTrigger < Trigger

  # condition format
  # {
  #   [
  #     {
  #       "option_code": "your option code here",
  #       "frame_code": "frame to jump code here"
  #     },
  #     {
  #       "option_code": "your another option code here",
  #       "frame_code": "another frame to jump code here"
  #     },
  #     ...
  #     {

  #     }
  #   ]

  # }

  def get_next_frame(session)
    #get last answer
    option = session.find_last_answer
    #parse condition to get jump options
    conditions_hash[:jumps].detect{ |jump| jump[:option_code] == option.code }[:frame_code]
    #return code of next frame
  end

end
