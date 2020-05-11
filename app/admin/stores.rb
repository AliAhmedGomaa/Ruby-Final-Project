ActiveAdmin.register Store do

 
  permit_params :name, :summary, :admin_user_id
  index do
    selectable_column
    id_column
    column :name
    column :summary
    column :created_at
    column :updated_at
    column "Seller", :admin_user
    actions
  end
 

  form do |f|
    f.inputs do
      f.input :name
      f.input :summary
      f.input :admin_user_id , :label =>'Seller', as: :select, collection:  AdminUser.get_Sellers.map {|t| [t.email , t.id]}

    end
    f.actions
  end
  
end
