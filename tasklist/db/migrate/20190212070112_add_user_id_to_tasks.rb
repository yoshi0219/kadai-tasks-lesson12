class AddUserIdToTasks < ActiveRecord::Migration[5.0]
  def change
    t.string :content
    t.string :title
    t.reference :user, foreign_key: true
  end
end
