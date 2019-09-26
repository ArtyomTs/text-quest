ActiveAdmin.register Frame do

  permit_params :title, :content, :is_final, :is_success, :is_check_point, :survey_id, :code

end
