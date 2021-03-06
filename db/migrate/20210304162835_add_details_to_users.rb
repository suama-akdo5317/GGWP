class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_column :users, :how_long, :string
    add_column :users, :my_guiter_brand, :string
    add_column :users, :my_guiter_model, :string
  end
end
