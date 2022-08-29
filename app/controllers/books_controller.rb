class BooksController < ApplicationController
  
  def new

  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    
    
    @book.user_id = current_user.id
    
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # 4. トップ画面へリダイレクト
    flash[:notice]="You have create book successfully."
    redirect_to user_path(current_user)
  
    
  end
  
  def index
   @user=current_user
 @book= Book.new
 @books=Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user=current_user
  end

  def edit
     @book = Book.find(params[:id])
    @user=current_user
  end
  
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end
  
def update
    @book = Book.find(params[:id])
    @book.update(book_params)
     flash[:notice]="You have updated book successfully."
    redirect_to book_path(@book.id)
end
  
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
