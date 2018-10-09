class AppUserRepo
  def app_users
    @users ||= service.get_users.map do |user_data|
      AppUser.new(user_data)
    end
  end

  def app_user(id)
    @user ||= AppUser.new(service.get_user(id))
  end

  private

  def service
    BattleshiftService.new
  end
end
