class BooksController < ApplicationController
  def home #トップページ

  end

  def index #投稿一覧表示
    @books = Book.all
    @book = Book.new# @book=Book.new 空箱作成
  end

  def show #詳細ページ
    @book = Book.find(params[:id])
  end

  def create# submitを押した際に適用される
    @book = Book.new(book_params)
    # Book.new(book_params)=不完全な箱（saveがされていない為）
    if @book.save
    # @bookには１つのレコードが保存
    flash[:success] = 'Book was successfully created.'
    redirect_to book_path(@book.id)
    # (@book.id)で保存されたから次のページに飛べる
    else
      @books = Book.all
      render :index #indexに戻す
    end
  end

  def edit #記事編集ページ
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = 'Book was successfully created.'
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit #indexに戻す
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
