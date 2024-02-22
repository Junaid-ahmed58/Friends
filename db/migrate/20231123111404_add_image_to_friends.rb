class AddImageToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :profile, :binary
  end
end
