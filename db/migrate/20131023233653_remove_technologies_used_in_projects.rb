class RemoveTechnologiesUsedInProjects < ActiveRecord::Migration
  def up
    add_column :projects, :technologies_used, :string
  end

  def down
  end
end
