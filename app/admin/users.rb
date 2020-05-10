ActiveAdmin.register User ,as: 'Buyers' do
  actions :index ,:show
 
  # permit_params do
  #   permitted = [:name, :avatar, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :avatar
    column :created_at
    actions
  end

  
end
