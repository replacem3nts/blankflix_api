class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :length
      t.string :url
      t.string :urlthumb
      t.timestamps
    end
  end
end
