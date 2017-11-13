class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :category_id
      t.integer :user_id
    end

    create_table :categories do |t|
      t.string :name
    end

    
  end
end
