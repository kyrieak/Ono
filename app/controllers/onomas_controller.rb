class OnomasController < ApplicationController
  def index
  end

  def create
  end

  private

  def onoma_params
    params.require(:onoma).permit(Onoma.attr_params)
  end
end
