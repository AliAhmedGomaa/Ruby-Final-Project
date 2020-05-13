class StoresController < ApplicationController
    def new
        @product = Product.new
        @image = @product.images.build
    end

    # def edit
    #     @product = Product.find(params[:id])
    # end

    def index
            @store=user_store
            @products = Product.where(store: @store)    
        
    end

    # def destroy
    #     @product = Product.find(params[:id])
    #     if !OrderProduct.exists?(:product_id => params[:id] ) 
    #          @product.destroy
    #          redirect_to stores_path
    #     else
    #         respond_to do |format|
    #             format.html {redirect_to stores_path, alert: 'Cant delete there is an order containing this product'}
    #         end

    #     end
    # end
       

    def show
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(product_params)
        @product.brand =Brand.find(@product.brand_id)
        @product.category = Category.find(@product.category_id)
        @product.store = Store.where(id: user_store).take

        if @product.save
            params[:image]['path'].each do |a|
            @image = @product.images.create!(:path => a, :product_id => @product.id)
            end
          redirect_to store_path(@product)
        else
            render 'new'
        end
    end

       
    # def update
    #     @product = Product.find(params[:id])
    
    #     if @product.update(product_params)
    #         params[:image]['path'].each do |a|
    #             @image = @product.images.update(:path => a, :product_id => @product.id)
    #         end
    #         redirect_to store_path(@product)
    #     else
    #        render 'edit'
    #     end
    # end

    # def orders

    #     @store=user_store
    #     @products = Product.where(store: @store)
    #     @order_products = OrderProduct.where(product_id: @products)
    #     render 'orders'
    # end  
    
    # def changeStatus
    #   @order_product = OrderProduct.find(params[:id])
    #   if(@order_product.product_status == 0) 
    #      @order_product.product_status = 1
    #   else
    #      @order_product.product_status = 2
    #   end
    #   @order_product.save

    #   @order_products = OrderProduct.where(order_id: @order_product.order_id)
    #   @order = Order.where(id: @order_product.order_id).take
    #   if @order_products.all? { |item| item.product_status == 1}
    #         @order.status = 1
    #         @order.save

    #   elsif @order_products.all? { |item| item.product_status == 2}
    #         @order.status = 2
    #         @order.save
    #   end      
    #   redirect_to({ :controller => :stores, :action => :orders })

    # end  


    # private

    #     def product_params
    #       params.require(:product).permit(:title, :brand_id, :price, :category_id, :quantity, :description, image_attributes: [:path])
    #     end    

    #     def user_store
    #         if admin_user_signed_in? && current_admin_user.role == 'seller'
    #             @currentUser =  current_admin_user.id
    #             @store = Store.select(:id).where(admin_user_id: @currentUser)
    #             return @store
    #         else
    #               redirect_to root_path
    #               returns
    #         end
           
    #     end    

end
