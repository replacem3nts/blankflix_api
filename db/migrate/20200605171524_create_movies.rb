class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.string :title
      t.string :smallthumb
      t.string :medthumb
      t.string :lrgthumb
      t.string :duration
      t.timestamps
    end
  end
end
