class LibrariesController < ApplicationController
  def index
    @library= Library.all
    respond_to do |format|
      format.json { render json: {library: @library}, status: :ok }
    end
  end
  def show
    respond_to do |format|
      begin
        @library= Library.find(params[:id])
        format.json {render json: {library: @library}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
   end
  def new
    @Library= Library.new
    respond_to do |format|
      format.json { render json: {library: @library}, status: :ok }
    end
  end
  def edit
    respond_to do |format|
      begin 
        @library= Library.find(params[:id])
        format.json { render json: {library: @library}, status: :ok }
      rescue ActiveRecord::RecordNotFound
        format.json { render json: {library: @library}, status: :unprocessable_entity }
      end
    end 
  end
  def create
    begin
      @library = Library.new(library_params)
        if @library.save
          respond_to do |format|
            format.json { render json: {library: @library}, status: :ok }
          end
        else
          respond_to do |format|
            format.json { render json: {library: @library.errors}, status: :unprocessable_entity }
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
        @library = Library.find(params[:id])
        @library.update(library_params)
        format.json { render json: {library: @library}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    respond_to do |format|
      begin 
        @library = Library.find(params[:id])
        @library.destroy
        format.json { render json: {}, status: :ok }
      rescue ActiveRecord::RecordNotFound
        format.json { render json: {library: @library}, status: :unprocessable_entity }
      end
    end
  end
  private
    def library_params
      params.require(:library).permit(:name, :address, :phone)
    end
end

