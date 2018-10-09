class UsersController < ApplicationController

  def show
    id = params[:id]
    #set env variable for endpoint
    # for now hardcode the heroku link
    @conn = Faraday.new(url: "http://localhost:3000")

    response = @conn.get("/api/v1/users/#{id}")
    data = JSON.parse(response.body, symbolize_names: true)
    @user = AppUser.new(data)
  end





  def index
    @conn = Faraday.new(url: "http://localhost:3000")

    response = @conn.get("/api/v1/users")
    data = JSON.parse(response.body, symbolize_names: true)
    @users = data.map do |user|
      AppUser.new(user)
    end
  end
end
