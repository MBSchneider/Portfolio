class UpdateComments < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.remove :author
      t.integer :author_id
    end
  end

  def down
  end
end
