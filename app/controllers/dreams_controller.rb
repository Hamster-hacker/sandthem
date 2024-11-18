class DreamsController < ApplicationController

  def index
    @dreams = Dream.all
  end
  def show
    @dream = Dream.find(params[:id])
  end
end
