class AddEmailExtensionToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :email_extension, :string
  end
end
