class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => [:admin] 
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
  def admin
    authorize! @user, :message => 'Not authorized as an administrator.'
  end

end
