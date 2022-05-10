require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "Validations" do
    context "when creating a product" do
      it "throws 0 errors when all fields present" do
        @category = Category.new
        @product = Product.create({name: "Hat", price: 5, quantity: 5, category: @category})
        expect(@product.valid?).to be_truthy
      end

      it "throws error if name is excluded" do
        @category = Category.new
        @product = Product.create({price: 5, quantity: 5, category: @category})
        expect(@product.errors.full_messages).to include("Name can't be blank") 
      end

      it "throws error if price is excluded" do
        @category = Category.new
        @product = Product.create({name: "Hat", quantity: 5, category: @category})
        expect(@product.errors.full_messages).to include("Price can't be blank") 
      end

      it "throws error if quantity is excluded" do
        @category = Category.new
        @product = Product.create({name: "Hat", price: 5, category: @category})
        expect(@product.errors.full_messages).to include("Quantity can't be blank") 
      end

      it "throws error if category is excluded" do
        @category = Category.new
        @product = Product.create({name: "Hat", price: 5, quantity: 5})
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

    end
  end
  
end
