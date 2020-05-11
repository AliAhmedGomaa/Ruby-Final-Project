class ProductController < ApplicationController
	def index
		@brands = Brand.all()
		@categories = Category.all()
		@stores = Store.all()
		@products = Product.all().page params[:p]
		@products = @products.filter_by_query(params[:search]) if params[:search].present?
		@products = @products.filter_by_category(params[:cat]) if params[:cat].present?
		@products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
		@products = @products.filter_by_store(params[:store]) if params[:store].present?
		if params[:min_price].present? && params[:max_price].present?
            min = params[:min_price]
            max = params[:max_price]
            min[0]='' if min[0] == '$'
            max[0]='' if max[0] == '$'  
            @products = @products.filter_by_price( min , max)  
        end
	end

	def show
		@brands = Brand.all()
		@categories = Category.all()
		@product = Product.find(params[:id])
		@products = @product.category.products.order('rand()').limit(4)
	end

	def products
		ids = params[:ids]

		render :json => { products: Product.find(ids).as_json(:only => [:id, :title, :price], :include => [:images => { :only => [:id, :path] }]) }
	end
end
