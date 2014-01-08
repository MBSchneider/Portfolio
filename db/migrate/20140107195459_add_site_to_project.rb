class AddSiteToProject < ActiveRecord::Migration
  def change
    add_column :projects, :web_page, :string
  end
end
