class LinksController < ApplicationController
  def new
  end

  def create
  end

  def word_list
    @unique_words = params["list"]

    respond_to do |format|
      format.html{ render :partial => "word_list",
                     :locals => { :unique_words => @unique_words } }
    end
  end

  def destroy
  end
end
