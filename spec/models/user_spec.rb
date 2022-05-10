require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user validation" do
    context "creating a new user" do
      context "passsword is required" do
        it "requires both password and password_confirmation fields to match" do
          @user = User.create({first_name: "Ted", last_name: "Mosby", email: "test12@test.com", password: "testtesttest", password_confirmation: "rrrrrrr"})
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "both password field is required" do
          @user = User.create({first_name: "Ted", last_name: "Mosby", email: "test12@test.com", password: "", password_confirmation: "rrrrrrr"})
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "both password/password_confirmation fields are both required" do
          @user = User.create({first_name: "Ted", last_name: "Mosby", email: "test12@test.com", password: "", password_confirmation: ""})
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "both password_confirmation field is required" do
          @user = User.create({first_name: "Ted", last_name: "Mosby", email: "test12@test.com", password: "dddddd", password_confirmation: ""})
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end

      context "emails is required" do
        it "user will not save if email is not stated" do
          @user = User.create({first_name: "Ted", last_name: "Mosby", password: "rrrrrrr", password_confirmation: "rrrrrrr"})
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
      end
      context "emails is unique" do
        it "user will not save if email is not unique to database" do
          @user = User.create({first_name: "Ted", last_name: "Mosby", email: "TEST@TEST.COM", password: "rrrrrrr", password_confirmation: "rrrrrrr"})
          @user2 = User.create({first_name: "Ted", last_name: "Dac", email: "test@test.COM", password: "rrrrrrr", password_confirmation: "rrrrrrr"})
          expect(@user2.errors.full_messages).to include("Email has already been taken")
        end
      end
      context "first name is required" do
        it "user will not save if first name is not provided" do
          @user = User.create({last_name: "David", email: "TEST@TEST.COM", password: "rrrrrrr", password_confirmation: "rrrrrrr"})
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
      end
      context "last name is required" do
        it "user will not save if last name is not provided" do
          @user = User.create({first_name: "Ted", email: "TEST@TEST.COM", password: "rrrrrrr", password_confirmation: "rrrrrrr"})
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
      end

      context "password minimium length" do
        it "throws error if password length is less than 5" do
          @user = User.create({first_name: "Ted", last_name: "David",email: "TEST@TEST.COM", password: "rrrr", password_confirmation: "rrrr"})
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
        end
      end
    end
  end
  
  describe "Login validation" do

    before do
      @testuser = User.create!({first_name: "Ted", last_name: "David",email: "test@test.com", password: "rrrrrrr", password_confirmation: "rrrrrrr"})
    end
    
      it "validates if email and password are correct" do
        user = User.authenticate_with_credentials('test@test.com', 'rrrrrrr')
        expect(user).to eq(@testuser)
      end
      it "returns nil if email/pass do not match" do
        user = User.authenticate_with_credentials('test@test.com', 'rrrrrr')
        expect(user).to be_nil
      end
      it "should return user if email has extra spacing" do
        user = User.authenticate_with_credentials('   test@test.com  ', 'rrrrrrr')
        expect(user).to eq(@testuser)
      end
      it "should return user if email is different case " do
        user = User.authenticate_with_credentials('TEST@test.com', 'rrrrrrr')
        expect(user).to eq(@testuser)
      end
  end
  
end
