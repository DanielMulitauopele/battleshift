class BattleshiftService
  def get_users
    get_json("/api/v1/users")
  end

  def get_user(id)
    get_json("/api/v1/users/#{id}")
  end

  def patch_user(id, email_params)
    conn.patch("/api/v1/users/#{id}", {email: email_params[:email]})
  end

  private

  def conn

    Faraday.new(url: ENV['ROOT_URL'])
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
