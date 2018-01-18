class MembersController < ApplicationController
	def index
    @member= Member.all
    respond_to do |format|
      format.json { render json: {member: @member}, status: :ok }
    end
  end
  def show
    respond_to do |format|
      begin
        @member= Member.find(params[:id])
        format.json {render json: {member: @member}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
   end
  def new
    @member= Member.new
  end
  def edit
    respond_to do |format|
      begin 
        @member= Member.find(params[:id])
        format.json { render json: {member: @member}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end 
  end
  def create
    begin
      @member = Member.new(member_params)
      if @member.save
        respond_to do |format|
          format.json { render json: {member: @member}, status: :ok }
        end
      else
        respond_to do |format|
          format.json { render json: {member: @member}, status: :unprocessable_entity }
        end
      end
    rescue => e
      respond_to do |format|
        format.json { render json: {member: @member}, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      begin 
        @member = Member.find(params[:id])
        @member.update(member_params)
        format.json { render json: {member: @member}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    respond_to do |format|
      begin 
        @member = Member.find(params[:id])
        @member.destroy
        format.json { render json: {}, status: :ok }
      rescue ActiveRecord::RecordNotFound
        format.json { render json: {member: @member}, status: :unprocessable_entity }
      end
    end
  end
  private
    def member_params
      params.require(:member).permit(:name, :address, :phone, :gender, :code, :validitydate, :is_author, :library_id)
    end
end
