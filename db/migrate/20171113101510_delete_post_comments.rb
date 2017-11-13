class DeletePostComments < ActiveRecord::Migration[5.1]
  def change
    drop_table :post_comments
  end
end
