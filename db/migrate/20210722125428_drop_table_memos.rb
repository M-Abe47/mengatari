class DropTableMemos < ActiveRecord::Migration[5.2]
  def change
    drop_table :memos
  end
end
