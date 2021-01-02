class ChangeBookAutherToBookAuthor < ActiveRecord::Migration[6.1]
  def change
    rename_table :book_authers, :book_authors
  end
end
