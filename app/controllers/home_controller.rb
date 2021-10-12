class HomeController < ApplicationController
  def index
    redirect_to login_path if current_user.nil?
    response = RestClient.get 'https://jsonplaceholder.typicode.com/users'
    @json = JSON.parse response
  end
end
