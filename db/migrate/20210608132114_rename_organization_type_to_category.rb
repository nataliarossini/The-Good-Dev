class RenameOrganizationTypeToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :organizations, :type, :category
  end
end
