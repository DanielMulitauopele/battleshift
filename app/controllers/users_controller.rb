class UsersController < ApplicationController
  def show
    id = params[:id]
    @conn = Faraday.new(url: "http://localhost:3000")

    response = @conn.get("/api/v1/users/#{id}")

    @user = JSON.parse(response.body, symbolize_names: true)

  end
end
