ActiveAdmin.register Frame do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :content, :is_final, :is_success, :is_check_point, :survey_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :is_final, :is_success, :is_check_point, :survey_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
