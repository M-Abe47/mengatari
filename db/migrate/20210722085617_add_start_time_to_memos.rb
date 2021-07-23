class AddStartTimeToMemos < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :start_time, :datetime
  end
end
