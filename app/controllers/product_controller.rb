class ProductController < ApplicationController
	def index
		@brands = Brand.all()
		@categories = Category.all()
		if (params[:brand].present? || params[:cat].present? || params[:search].present? || params[:min_price])
			@products = Product.where(['title like ? or description like ?', "%#{params[:search]}%", "%#{params[:search]}%"]).page params[:p] if params[:search].present?
			if @products.nil?
				@products = Product.all().page params[:p]
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
