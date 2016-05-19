class BoxesController < ApplicationController
  before_action :require_user

  def index
    @boxes = Box.all
    @box = Box.order("created_at DESC")
  end

  def new
    @box = Box.new(:material_id => params[:material_id], :location_id => params[:location_id])
    @job = Job.find(params[:job_id])
    @boxes = @job.boxes.where(is_raw: true)
  end

  def create
    if params[:job_id]
      @job = Job.find(params[:job_id])
      @box = @job.boxes.new(box_params)
      @box.is_raw = true
      if @box.save
        redirect_to new_job_box_path(@job, :material_id => @box.material_id, :location_id => @box.location_id)
      else
        @boxes = @job.boxes.reject{ |box| box == @box }
        render :new
      end
    elsif params[:job_machine_id]
      @job_machine = JobMachine.find(params[:job_machine_id])
      @box = @job_machine.output_boxes.new(box_params)
      @box.job = @job_machine.job
      if @box.save
        redirect_to job_machine_path(@job_machine, :material_id => @box.material_id, :location_id => @box.location_id)
      else
        @job = @job_machine
        @boxes = @job_machine.output_boxes.reject{ |box| box == @box }
        render :new
      end
    end
  end

  def next_step
    @job_machine = JobMachine.find(params[:job_machine_id])
    @box = Box.find(params[:id])
    if @job_machine.next_machine
      @box.input_id = @job_machine.next_machine.id
    else
      @box.is_final = true
    end
      @box.save!
    redirect_to :back
  end

  def edit
  end

  def update
    @box = Box.find(parmas[:id])
    @box.attributes = box_params
    if @box.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @box = Box.find(params[:id])
    @box.destroyer = true
    @box.save
    redirect_to :back
  end

  private

  def box_params
    params.require(:box).permit(:location_id, :material_weight, :material_id, :job_id, :output_id, :input_id, :is_final, :is_raw)
  end
end
