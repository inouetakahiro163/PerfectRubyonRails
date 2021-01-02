class ChangeAutherToAuthor < ActiveRecord::Migration[6.1]
  def change
    rename_table :authers, :authors
  end
end
