class Api::V1::SavesController < ApplicationController

  def index
    @saves = Save.all
    render json: @saves
  end

  def create
    @save = Save.new(save_params)
    if @save.save
      render json: @save
    else
      render json: [message: "Save failed."]
    end
  end

  def update
    if @save.update(params[:save])
      render json: @save
    else
      render json: [error: @save.errors.messages]
    end
  end

  def destroy
    @save = Save.find_by(id: params[:id])
    @save.destroy
    render json: [message: "Save deleted."]
  end


  private

  def save_params
    params.require(:save).permit(:user_id, :place_id, :type, :source)
  end

end
