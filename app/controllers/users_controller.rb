class UsersController < ApplicationController
  # アクセスを制限を始めに実行
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page])
  end

  def index
    @users = User.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "・Name can't be blank"
      render :edit
    end
  end

  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

    # アクセスを制限
    def is_matching_login_user
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to books_path
      end
    end
end
