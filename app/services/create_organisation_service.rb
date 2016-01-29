class CreateOrganisationService
  def call(user, name)
    @org = Organisation.find_or_create_by!(name: name) do |org|
      user.organisation = org
      user.save!
    end
  end
end
