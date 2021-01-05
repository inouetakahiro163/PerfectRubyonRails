class BooksController < ApplicationController
  # CSRF対策をoffに設定
  protect_from_forgery expect: [:destroy]
  # 重複する処理をフックしておく
  before_action :set_book, only: [:show, :destroy]

  # applicationControllerで定義したフックをスキップする場合
  # skip_before_action :require_login, only: [:new, :create]

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
