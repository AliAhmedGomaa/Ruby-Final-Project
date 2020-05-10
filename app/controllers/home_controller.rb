class HomeController < ApplicationController
    def index
    end

    def shop
        @brands = Brand.all()
        @categories = Category.all()
        if(params[:brand].present? || params[:cat].present? || params[:search].present?  )
            @products =  Product.where(['title like ? or description like ?',"%#{params[:search]}%","%#{params[:search]}%"]) if params[:search].present?
            if @products.nil?   
                @products=Product.all();
            end 
            @products = @products.filter_by_category(params[:cat]) if params[:cat].present?
            @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
        else
            @products=Product.limit(9);
        end
    end
   

    def product
    end

    def cart
        @products = Product.limit(4)
    end

    def checkout
    end
end
