class AddTagListToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :tag_list, :string
  end
end
