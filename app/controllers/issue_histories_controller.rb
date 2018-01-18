class IssueHistoriesController < ApplicationController
	def index 
    respond_to do |format|
      @issuehistories = IssueHistory.all
      format.json { render json: {issuehistories: @issuehistories}, status: :ok }
    end
  end
  def show
    respond_to do |format|
      begin
      	@issue_history = IssueHistory.find(params[:id])
        format.json { render json: {issue_history: @issue_history}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end
  def new
    @issue_history = IssueHistory.new
  end
  def edit
  	respond_to do |format|
      begin
        @issue_history= IssueHistory.find(params[:id])
       	format.json { render json: {issue_history: @issue_history}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end	
  end
  def create
    begin
      @issue_history = IssueHistory.new(issue_history_params)
      if @issue_history.save
        respond_to do |format|
          format.json { render json: {issue_history: @issue_history}, status: :ok }
        end
      else
        respond_to do |format|
          format.json { render json: {error: @issue_history.errors}, status: :unprocessable_entity }
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
        @issue_history = IssueHistory.find(params[:id])
        if @issue_history.update(issue_history_params)
          format.json { render json: {issue_history: @issue_history}, status: :ok }
	      else
          format.json { render json: {issue_history: @issue_history.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
  	  end
  	end
  end
  def destroy
   	respond_to do |format|
	    begin 
	  	  @issue_history= IssueHistory.find(params[:id])
	  	  if @issue_history.destroy
       	  format.json { render json: {mesage: "Deleted!"}, status: :ok }
        else
          format.json { render json: {issuehistory: @issue_history.errors}, status: :unprocessable_entity }
        end
      rescue => e
        format.json { render json: {message: e.message}, status: :unprocessable_entity }
      end
    end
  end
  private
  def issue_history_params
 	  params.require(:issue_history).permit(:member_id, :book_id, :return, :issue, :name, :copy)
	end
end