class BooksController < ApplicationController
  def index
    @space_id = params[:redu_space_id]
    @subject_id = client(@space_id).first_subject_id
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def add_to_redu
    @book = Book.find(params[:id])

    space_id = params[:space_id]
    subject_id = params[:subject_id]

    client(space_id).create_lecture(subject_id, @book.name, book_url(@book))
  end
end
