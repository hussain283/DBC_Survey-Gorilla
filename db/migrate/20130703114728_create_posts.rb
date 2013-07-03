class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :url
      t.references :user
      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.references :post
      t.references :user
      t.timestamps
    end
      
  end
end
