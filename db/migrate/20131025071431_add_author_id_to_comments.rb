class AddAuthorIdToComments < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.integer :author_id
    end
  end

  def down
  end
end
