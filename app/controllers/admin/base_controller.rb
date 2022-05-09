class Admin::BaseController < ApplicationController
#authentication filter to pass to other admin controllers
http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD']

end