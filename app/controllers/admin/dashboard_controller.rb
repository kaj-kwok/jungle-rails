class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD']

  def show
    @products = Product.count
    @categories = Category.count
    @category = Category.all
  end
end
