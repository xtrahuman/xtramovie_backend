# frozen_string_literal: true

class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 0

    User.update_all(role: 0)  # Set existing users' roles to 'user'

    change_column_null :users, :role, false
    add_index :users, :role
  end
end
