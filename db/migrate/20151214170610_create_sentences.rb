class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
