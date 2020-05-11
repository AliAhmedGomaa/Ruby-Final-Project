ActiveAdmin.register Product do
  # scope :all, default: true
  before_action :check_store
  scope_to :current_admin_user , :association_method => :store_products , if: proc{current_admin_user.get_role == 'seller'}

  controller do
    def check_store
      if current_admin_user.store.nil?
        redirect_to admin_dashboard_path
    end
  end
  end
  before_save do |product|
    
    product.store_id = current_admin_user.store.id
  end
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
  
  permit_params :title, :description, :price, :quantity, :category_id, :brand_id , :product_id,
              images_attributes: [:path]
  
 end

