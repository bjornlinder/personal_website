class AddAllowCommentsColumn < ActiveRecord::Migration
  def change
    add_column :posts, :allow_comments, default: true
    add_index :comments, :post_id
  end
end
