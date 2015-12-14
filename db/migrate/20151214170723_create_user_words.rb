class CreateUserWords < ActiveRecord::Migration
  def change
    create_table :user_words do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
