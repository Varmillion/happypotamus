class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :about, :text
    add_column :users, :mobile, :integer
    add_column :users, :birthday, :date
  end
end
