class CreateOrganiserService
  def call(email)
    @user = User.find_or_create_by!(email: email) do |user|
      user.password = 'changeme'
      user.password_confirmation = 'changeme'
      user.confirm!
      user.organiser!
    end
  end
end
