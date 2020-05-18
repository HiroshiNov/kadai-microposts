class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }
      # t.references という記述は別のテーブルを参照させるという意味になります。
      #   { to_table: :users } というオプションによって、外部キーとしてusersテーブルを参照するという指定を行っています。
      # そのまま実行しようとした場合、Rails のデフォルトの命名規則により、 
      # follows テーブルを参照しようとして、そんなテーブルはないとエラーになってしまいます。

      t.timestamps
      
      t.index [:user_id, :follow_id], unique: true
      # user_id と follow_id のペアで重複するものが保存されないようにするデータベースの設定です。
    end
  end
end
