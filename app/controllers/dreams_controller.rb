class DreamsController < ApplicationController

  def index
    @dreams = Dream.all
  end
end
