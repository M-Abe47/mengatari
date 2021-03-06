class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :genre_id
      t.string :image_id
      t.string :title
      t.text :body
      t.string :name
      t.timestamps
    end
  end
end
