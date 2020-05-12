class ApiController < ApplicationController

def products
    @products = Product.page params[:p]
    page_count = (Product.count / 12.to_f).ceil
    render json: @products.to_json(:include=>{:category =>{:only => :name},:brand=>{:only=>:name},:images=>{:only => :path}},:meta=>{total_pages: page_count})
end

def product
    @product=Product.find(params[:id])
    render json: @product.to_json(:include=>{:category =>{:only => :name},:brand=>{:only=>:name},:images=>{:only => :path}})
end

end