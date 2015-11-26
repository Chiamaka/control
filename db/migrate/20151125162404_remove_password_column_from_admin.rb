class RemovePasswordColumnFromAdmin < ActiveRecord::Migration
 def up
  	remove_column :admins, :password
  end

  def down
  	add_column :admins, :password
  end
end
