class AddDefaultToStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :applications, :status, 0
  end
end
