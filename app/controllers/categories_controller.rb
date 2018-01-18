class CategoriesController < ApplicationController
	def index 
    respond_to do |format|
      @category = Category.all
      format.json { render json: {category: @category}, status: :ok }
    end
  end
  def show
    respond_to do |format|
      begin
      	@category = Category.find(params[:id])
        format.json { render json: {category: @category}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end
  def new
    @category = Category.new
  end
  def edit
  	respond_to do |format|
      begin
        @category= Category.find(params[:id])
       	format.json { render json: {category: @category}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end	
  end
  def create 
    begin
      @category = Category.new(category_params)
        if @category.save
          respond_to do |format|
            format.json { render json: {category: @category}, status: :ok }
          end
        else
          respond_to do |format|
            format.json { render json: {category: @category.errors}, status: :unprocessable_entity }
          end
        end
    rescue => e
      respond_to do |format|
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end  
    end
  end
  def update
    respond_to do |format|
      begin 
        @category = Category.find(params[:id])
        if @category.update(category_params)
          format.json { render json: {category: @category}, status: :ok }
	      else
          format.json { render json: {category: @category.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
  	  end
  	end
  end
  def destroy
   	respond_to do |format|
	    begin 
	  	  @category= Category.find(params[:id])
	  	  if @category.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
        else
          format.json { render json: {comment: @comment.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end
  private
  def category_params
 	  params.require(:category).permit(:name)
	end
end