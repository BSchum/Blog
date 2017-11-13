class CreatePostComment < ActiveRecord::Migration[5.1]
  def change
    create_table :post_comments do |t|
      t.integer :post_id
      t.integer :comment_id
    end
  end
end
