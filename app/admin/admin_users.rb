ActiveAdmin.register AdminUser ,as: "Admins/Sellers"do
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    column "Role" do |user|
       user.role == 1 ? 'Seller' :'Admin'
    end
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role ,as: :select , collection: { 'Admin' => 0 , 'Seller' => 1 }

    end
    f.actions
  end


  controller do
    def update
      @user = AdminUser.find(params[:id])
      if params[:admin_user][:password].blank?
        @user.update_without_password(permitted_params[:admin_user])
      else
        @user.update_attributes(permitted_params[:admin_user])
      end
      if @user.errors.blank?
        redirect_to admin_admin_users_path, :notice => "User updated successfully."
      else
        render :edit
      end
    end

    def user_params
      params[:admin_user].permit(:email,:role,:password)
    end 
  end

 

end
