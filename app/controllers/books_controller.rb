class BooksController < ApplicationController
        before_action :authenticate_user!
  def life
     @books = Book.all
   end
        
  def self
     @books = Book.all
   end
        
  def work
     @books = Book.all
   end

  def psychology
     @books = Book.all
   end
        
  def thought
     @books = Book.all
   end
        
  def business
     @books = Book.all
   end
  def index
    @books = Book.all
    
    search = params[:search]
    if search.present?
     @books = Book.joins(:user).where("namer LIKE ? OR author LIKE ? OR year LIKE ? OR company LIKE ? OR learn LIKE ? OR practice LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
    @books = @books.page(params[:page]).per(10)
  end
      
        def new
          @book = Book.new
        end
      
        def create
          book = Book.new(book_params)
          book.user_id = current_user.id
          if book.save
            redirect_to :action => "index"
          else
            redirect_to :action => "new"
          end
        end
      
        def show
          @book = Book.find(params[:id])
          @comments = @book.comments
          @comment = Comment.new
        end
      
        def edit
          @book = Book.find(params[:id])
        end
      
        def update
          book = Book.find(params[:id])
          if book.update(book_params)
            redirect_to :action => "show", :id => book.id
          else
            redirect_to :action => "new"
          end
        end
      
        def destroy
          book = Book.find(params[:id])
          book.destroy
          redirect_to action: :index
        end
        
        private
        def book_params
          params.require(:book).permit(:namer, :author, :year, :company, :learn, :practice,:cotent,:category)
        end
      end
