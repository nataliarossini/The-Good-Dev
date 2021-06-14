class AddUsersToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :user
    add_reference :chatrooms, :recipient
    add_foreign_key :chatrooms, :users, column: :recipient_id, primary_key: :id
  end
end
