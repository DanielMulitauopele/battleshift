class BattleshiftService
  def get_users
    get_json("/api/v1/users")
  end

  def get_user(id)
    get_json("/api/v1/users/#{id}")
  end

  def patch_user(id, email)
    conn.patch("/api/v1/users/#{id}", {email: email})
  end

  private

  def conn
    Faraday.new(url: "https://gentle-reef-11092.herokuapp.com")
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
