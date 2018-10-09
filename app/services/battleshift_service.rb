class BattleshiftService
  def get_users
    get_json("/api/v1/users")
  end

  def get_user(id)
    get_json("/api/v1/users/#{id}")
  end

  private

  def conn
    #set env variable for endpoint
    # for now hardcode the heroku link
    
    Faraday.new(url: "http://localhost:3000")
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
