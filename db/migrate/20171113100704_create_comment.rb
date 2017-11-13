class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :mail
      t.string :content
      t.string :post_id
      t.timestamps
    end
  end
end
