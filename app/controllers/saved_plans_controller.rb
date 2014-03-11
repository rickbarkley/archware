class SavedPlansController < ApplicationController

	#before_filter :authenticate_user! 
  # GET /registers
  # GET /registers.json
  def index
   
    @saved_plan = SavedPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @saved_plans }
    end
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
    @saved_plan = SavedPlan.find(params[:id])
      @plan = Plan.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @saved_plans }
    end
  end

  # GET /registers/new
  # GET /registers/new.json
  def new

    @plan = Plan.find(params[:plan_id])
    @saved_plan = @plan.saved_plans.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @saved_plan }
    end
  end

    # POST /registers
  # POST /registers.json
  def create
    @saved_plan = SavedPlan.new(params[:saved_plan])

    respond_to do |format|
      if @saved_plan.save
        format.html { redirect_to current_user, notice: 'Plan was successfully Saved.' }
        format.json { render json: @saved_plan.plan, status: :created, location: @saved_plan.plan }
      else
        format.html { render action: "new" }
        format.json { render json: @saved_plan.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @saved_plan = SavedPlan.find(params[:id])
    @saved_plan.destroy

    respond_to do |format|
      format.html { redirect_to plans_path }
      format.json { head :no_content }
    end
  end
end
