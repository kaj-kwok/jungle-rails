class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD']

  def show
    @products = Product.count
    puts "number of products, #{@products}" 
    @categories = Category.count
    puts "number of categories, #{@categories}" 
    @category = Category.all
    p @category
  end
end
