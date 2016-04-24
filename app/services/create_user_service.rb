class CreateUserService
  def call(email, name)
    @user = User.find_or_create_by!(email: email) do |user|
      user.password = 'changeme'
      user.name = name
      user.password_confirmation = 'changeme'
      user.confirm!
      user.user!
    end
  end
end
