class BooksController < ApplicationController
	def index 
    respond_to do |format|
      @book = Book.all
      format.json { render json: {book: @book}, status: :ok }
    end
  end
  def show
    respond_to do |format|
      begin
      	@book = Book.find(params[:id])
        format.json { render json: {book: @Book}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end
  def new
    @book = Book.new
    respond_to do |format|
      format.json { render json: {book: @Book}, status: :ok }
    end
  end
  def edit
  	respond_to do |format|
      begin
        @book= Book.find(params[:id])
       	format.json { render json: {book: @book}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end	
  end
  def create
    respond_to do |format|
      begin
        @book = Book.new(book_params)
          if @book.save
            format.json { render json: {book: @book}, status: :ok }
          else
            format.json { render json: {error: @book.errors}, status: :unprocessable_entity }
          end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      begin 
        @book = Book.find(params[:id])
        if @book.update(book_params)
          format.json { render json: {book: @book}, status: :ok }
	      else
          format.json { render json: {book: @book.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
  	  end
  	end
  end
  def destroy
   	respond_to do |format|
	    begin 
	  	  @book= Book.find(params[:id])
	  	  if @book.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
        else
          format.json { render json: {book: @book.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end
  private
  def book_params
 	  params.require(:book).permit(:name, :code, :author, :price, :publication, :version, :copy, :library_id, :category_id)
	end
end