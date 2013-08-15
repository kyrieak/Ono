class KeyController < ApplicationController
  
  def index
    @unique_words = JSON.parse(params["list"])
    
    respond_to do |format|
      format.html{ render :index, :layout => false }
    end

  end #index

end #class