class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
  end
end
