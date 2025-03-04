class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      ## 本のタイトル
      t.string :title

      ## 感想
      t.text :body
      
      ## ユーザーID
      t.integer :user_id

      t.timestamps
    end
  end
end
