class TotalWeightTrigger < Trigger

  # condition format
  # {
  #   [
  #     {
  #       "weight_from": "lower bound of total weight",
  #       "weight_to": "upper bound of total weight",
  #       "frame_code": "frame to jump code here"
  #     },
  #     {
  #       "weight_from": "lower bound of total weight",
  #       "weight_to": "upper bound of total weight",
  #       "frame_code": "another frame to jump code here"
  #     },
  #     ...
  #     {

  #     }
  #   ]

  # }

  def get_next_frame(session)
    #parse condition to get jump options
    #get last answer
    #return code of next frame
  end

end
