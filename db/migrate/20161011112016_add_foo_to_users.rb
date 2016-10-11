class AddFooToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :foo, :string
  end
end
