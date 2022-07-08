class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
    
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Book"
      @books = Book.looks(params[:search], params[:word])
    else
      @books = Tag.search_books_for(params[:search], params[:word])
    end
  end
  
  def search_book
    @book = Book.new
    @books = Tag.search_books_for(params[:search], params[:word])
  end
  
  

end
