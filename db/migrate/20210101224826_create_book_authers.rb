class CreateBookAuthers < ActiveRecord::Migration[6.1]
  def change
    create_table :book_authers do |t|
      t.references :book, null: false, foreign_key: true
      t.references :auther, null: false, foreign_key: true

      t.timestamps
    end
  end
end
