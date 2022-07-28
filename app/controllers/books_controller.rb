# frozen_string_literal: true

class BooksController < DashboardController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new edit]

  def index
    @books = authorize Book.all
  end

  def new
    @book = authorize Book.new
  end

  def create
    @book = authorize Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: t('.controller.create') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: t('.controller.update') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def destroy
    @book.destroy
    flash[:notice] = t('.controller.destroy')
    redirect_to books_url
  end

  private

  def set_book
    @book = authorize Book.find(params[:id])
  end

  def set_categories
    @categories = authorize Category.all
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :price, :publishing_house, :publishing_date, :cover,
                                 :language, category_ids: [])
  end
end
