class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :registration
      t.string :url
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
