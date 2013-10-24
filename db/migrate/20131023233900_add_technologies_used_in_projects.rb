class AddTechnologiesUsedToProjects < ActiveRecord::Migration
  def up
    change_table :projects do |t|
      t.add :technologies_used
    end
  end

  def down
  end
end
