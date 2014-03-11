class PlansController < ApplicationController

  # GET /plans
  # GET /plans.json
  def index

    @q = Plan.search(params[:q])
    @plans = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 10)
    @q.build_sort if @q.sorts.empty?

    respond_to do |format|
      format.html # index.html.erbs
      format.json { render json: @plans }
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @plan = Plan.find(params[:id])
    #@image = Image.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.json
  def new
    authorize! :new, @user, :message => 'Not authorized as an administrator.'
    @plan = Plan.new
    #2.times { @plan.images.build }



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plan }
    end
  end

  # GET /plans/1/edit
  def edit
    authorize! :edit, @user, :message => 'Not authorized as an administrator.'
    @plan = Plan.find(params[:id])

  end

  # POST /plans
  # POST /plans.json
  def create
    authorize! :create, @user, :message => 'Not authorized as an administrator.'
    @plan = Plan.new(params[:plan])

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render json: @plan, status: :created, location: @plan }
      else
        format.html { render action: "new" }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plans/1
  # PUT /plans/1.json
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :no_content }
    end
  end

  def add_to_cart
  @cart = get_cart
  @cart.add_to_cart(Plan.find(params[:id]))
end

def get_cart
  if session[:cart]
    return session[:cart]
  else
    session[:cart] = Cart.new
    return session[:cart]
  end
end
end
