ActiveAdmin.register Product do
  scope :all, default: true

  form   title: 'Add new product' do |f|
      store=Store.find_by(admin_user: current_user)
      inputs 'Details' do
      input :title
      input :category, label: "Category"
      input :brand, label: "Brand"
      input :description, label: "Description"
      input :price, label: "Price"
      input :quantity, label: "Quantity"
      
    
    end
    panel 'Photos' do
   
    f.has_many  :images , :html => { :enctype => "multipart/form-data" }  , allow_destroy: true do |ff|
      ff.input :product_id, as: :hidden
      ff.input :path , label: "image" , required: true , as: :file 

    end
    end
    
    para "Press cancel to return to the list without saving."
    actions
 end
  
  permit_params :title, :description, :price, :quantity, :category_id, :brand_id ,:store,
              images_attributes: [:path]
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :price, :quantity, :category_id, :brand_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
 end

