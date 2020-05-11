class ApiController < ApplicationController

def products
    @products = Product.all();
    render json: @products.to_json(:include=>{:category =>{:only => :name},:brand=>{:only=>:name},:images=>{:only => :path}})
end

def product
    @product=Product.find(params[:id])
    render json: @product.to_json(:include=>{:category =>{:only => :name},:brand=>{:only=>:name},:images=>{:only => :path}})
end

end