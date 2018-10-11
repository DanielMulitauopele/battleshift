class AppUser
  attr_reader :name,
              :email,
              :id

  def initialize(data)
    @name = data[:name]
    @email = data[:email]
    @id = data[:id]
  end
end
