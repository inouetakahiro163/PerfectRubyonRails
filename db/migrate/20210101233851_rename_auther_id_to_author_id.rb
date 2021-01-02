class RenameAutherIdToAuthorId < ActiveRecord::Migration[6.1]
  def change
    rename_column :book_authors, :auther_id, :author_id
  end
end
