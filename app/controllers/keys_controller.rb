class KeysController < ApplicationController
  
  def index
    @unique_words = JSON.parse(params["list"])
    
    respond_to do |format|
      format.html{ render :index, :layout => false }
    end

  end

  def create
    @key = Key.new(params[:key])
    if @key.duplicate?
      render "index"
    else
      @key.save
    end
  end

  private

  def key_params
    params.require(:key).permit(Key.attr_params)
  end

end