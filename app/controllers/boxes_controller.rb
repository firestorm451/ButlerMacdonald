class BoxesController < ApplicationController
  before_action :require_user

  def index
    @boxes = Box.all
    @box = Box.order("created_at DESC")
  end

  def new
    @box = Box.new(:material_id => params[:material_id], :location_id => params[:location_id])
    @job = Job.find(params[:job_id])
  end

  def create
    @job = Job.find(params[:job_id])
    @box = @job.boxes.new(box_params)
    if @box.save
      redirect_to new_job_box_path(@job, :material_id => @box.material_id, :location_id => @box.location_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @box.attributes = box_params
    if @box.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def box_params
    params.require(:box).permit(:location_id, :material_weight, :material_id, :job_id, :output_id, :input_id, :is_final, :is_raw)
  end
end
