class KeyController < ApplicationController
  
  def index
    @unique_words = JSON.parse(params["list"])
    
    respond_to do |format|
      format.html{ render :index, :layout => false }
    end

  end

  private

  def key_params
    params.require(:key).permit(Key.attr_params)
  end

end