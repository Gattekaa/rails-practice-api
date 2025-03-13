class CreateBooksreports < ActiveRecord::Migration[8.0]
  def change
    create_table :booksreports do |t|
      t.json :data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
