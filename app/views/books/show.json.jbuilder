json.extract! @book, :id, :name, :price
# jbuilerで！を使用しない場合json.キー "値"　の扱いになる
json.name_with_id "#{@book.id}-#{@book.name}"
json.publisher do
  json.name @book.publisher.name
  json.address @book.publisher.address
end

json.books Book.all do |book|
  json.extract! book, :id, :name, :price
end