class Admin::DashboardController < Admin::BaseController

  def show
    @products = Product.count
    @categories = Category.count
    @category = Category.all
  end
end
