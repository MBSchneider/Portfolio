class AddEmailToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :email, :string
    add_column :contacts, :name, :string
    add_column :contacts, :content, :text
  end
end
