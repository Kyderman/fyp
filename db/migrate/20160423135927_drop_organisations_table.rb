class DropOrganisationsTable < ActiveRecord::Migration
    def up
    drop_table :organisations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
