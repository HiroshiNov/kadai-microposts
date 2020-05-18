class Relationship < ApplicationRecord
  belongs_to :user
  # モデル名_id の名前になっている user_id はRailsの方で自動的にUserを参照するようになっていますが、
  belongs_to :follow, class_name: 'User'
  # follow_id の方はこの規則に従っていないため class_name: 'User' と補足設定する必要があります。
  # これにより follow が Follow という存在しないクラスを参照することを防ぎ、User クラスを参照するものだと明示します。  
end
