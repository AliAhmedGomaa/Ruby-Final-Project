ActiveAdmin.register Product do
  scope_to :current_admin_user , :association_method => :store_products , if: proc{current_admin_user.get_role == 'seller'}

  form   title: 'Add new product' do |f|
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
  
  permit_params :title, :description, :price, :quantity, :category_id, :brand_id ,
              images_attributes: [:path]
  
 end

