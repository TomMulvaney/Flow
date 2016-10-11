class RenameHashedPasswordToEncryptedPasswordInUsers < ActiveRecord::Migration[5.0]
  def up
    rename_column :users, :hashed_password, :encrypted_password
  end

  def down
    rename_column :users, :encrypted_password, :hashed_password
  end
end
