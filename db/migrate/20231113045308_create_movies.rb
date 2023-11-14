class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.boolean :adult
      t.string :backdrop_path
      t.string :original_language
      t.string :original_title
      t.text :overview
      t.decimal :popularity
      t.string :poster_path
      t.date :release_date
      t.string :title
      t.boolean :video
      t.decimal :vote_average
      t.integer :vote_count

      t.timestamps
    end
  end
end
