class BooksController < ApplicationController
  def home #トップページ

  end

  def index #投稿一覧表示
    @books = Book.all
  end

  def show #詳細ページ
  end

  def new #新規投稿ページ（index内に記述）
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def edit #記事編集ページ
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
