class AddUserToFolder < ActiveRecord::Migration[5.2]
  def change
    add_reference :folders, :user, foreign_key: true
  end
end
