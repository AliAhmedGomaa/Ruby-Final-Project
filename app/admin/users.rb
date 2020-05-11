ActiveAdmin.register User ,as: 'Buyers' do
  actions :index ,:show,:destroy
 
 
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
