class HomeController < ApplicationController
    def index
        @brands = Brand.all()
        @categories=Category.all()
        @products = Product.all()
    end
end
