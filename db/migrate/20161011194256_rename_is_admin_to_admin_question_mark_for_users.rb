class RenameIsAdminToAdminQuestionMarkForUsers < ActiveRecord::Migration[5.0]
  def up
    rename_column :users, :is_admin, :admin?
  end

  def down
    rename_column :users, :admin?, :is_admin
  end
end
