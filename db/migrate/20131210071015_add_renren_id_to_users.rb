class AddRenrenIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :renren_id, :string
    add_index :users, :renren_id
  end

end
