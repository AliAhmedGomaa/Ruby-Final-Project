class HomeController < ApplicationController
    def index
    end

    def shop
        @brands = Brand.all()
        @categories = Category.all()
        @products = Product.limit(9)
    end

    def product
    end

    def cart
    end

    def checkout
    end
end
