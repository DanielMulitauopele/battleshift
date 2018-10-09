class UsersController < ApplicationController
  def index
    @conn = Faraday.new(url: "http://localhost:3000")
    response = @conn.get("/api/v1/users")

    results = JSON.parse(response.body, symbolize_names: true)

    @users = results.map do |result|
      AppUser.new(result)
    end
  end

  def show
    id = params[:id]

    @conn = Faraday.new(url: "http://localhost:3000")
    response = @conn.get("/api/v1/users/#{id}")

    result = JSON.parse(response.body, symbolize_names: true)

    @user = AppUser.new(result)
  end
end
