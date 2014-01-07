class PagesController < ApplicationController
  def home
    
    @q = Plan.search(params[:q])
    @plans = @q.result(distinct: true)
  end

  def about
  end

  def contact
  end

  def purchase_info
  end

  def custom_mods
  end

  def questions
  end

end
