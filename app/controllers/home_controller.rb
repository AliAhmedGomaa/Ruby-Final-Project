class HomeController < ApplicationController
    def index
    end

    def shop
        @brands = Brand.all()
        @categories = Category.all()
        if(params[:brand].present? || params[:cat].present? || params[:search].present? || params[:min_price])
            @products =  Product.where(['title like ? or description like ?',"%#{params[:search]}%","%#{params[:search]}%"]).page params[:p] if params[:search].present?
            if @products.nil?   
                @products=Product.all().page params[:p];
            end 
            @products = @products.filter_by_category(params[:cat]) if params[:cat].present?
            @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
            min = params[:min_price]
            max = params[:max_price]
            min[0]='' if min[0] == '$'
            max[0]='' if max[0] == '$'  
            @products = @products.filter_by_price( min , max)  
        else
            @products=Product.page params[:p];
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
