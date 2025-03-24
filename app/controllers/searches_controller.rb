class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      @kaminari = @users.page(params[:page])
    else
      @books = Book.looks(params[:search], params[:word])
      @kaminari = @books.page(params[:page])
    end
  end
end