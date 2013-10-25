class UpdateCommentsToPolymorphic < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.remove :author_id
      t.integer :commentable_id
      t.string :commentable_type
    end
    remove_index :comments, :post_id
    add_index :comments, [:commentable_id, :commentable_type]
  end

  def down
  end

end
