class HomeController < ApplicationController

  def contact
    respond_to do |format|
      format.html # show.html.erb
#      format.json { render json: @post }
    end
  end


end
