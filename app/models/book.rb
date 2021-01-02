class Book < ApplicationRecord
  # scopeとはActiveRecordの検索条件に名前をつけてひとまとめにしたもの => ActiveRecord::Relation
  scope :costly, -> { where("price > ?", 3000) }
  # scopeに引数を渡すこともできる
  scope :written_about, -> (theme){ where("name like ?", "#{theme}") }

  belongs_to :publisher
  has_many :book_authors
  has_many :author, through: :book_authors

  validates :name, presence: true, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0}
  # 独自のバリデーションを追加
  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise"
    end
  end
  # コールバックを使う
  before_validation :add_lovely_to_cat

  def add_lovely_to_cat
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end
  
  # :if,:unlessオプションを使用して特定の条件のみコールバックを実装する
  after_destroy :if => :high_price? do
    Rails.logger.warn "High price book is deleted: #{self.attributes}"
  end

  def high_price?
    price >= 5000 
  end
end
