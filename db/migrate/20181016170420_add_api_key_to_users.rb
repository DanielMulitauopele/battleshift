class AddApiKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :api_key, :string
    remove_column :users, :activation_digest
  end
end
