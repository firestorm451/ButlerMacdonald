class JobsController < ApplicationController

  def new
    @job = Job.new
    @job.job_status = "inactive"
    @job.job_machines.build
    @job.boxes.build
  end

  def index
    @job = Job.new
    @jobs = Job.all.order("job_number DESC")
  end

  def show
    @job = Job.find(params[:id])
    @start_boxes = @job.boxes.where(is_raw: true)
    @final_boxes = @job.boxes.where(is_final: true)
    @machines = @job.machines.order("step_number")
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      if params[:process] == 'add_machines'
        redirect_to assign_machines_job_path(@job)
      elsif params[:process] == 'assign_machines'
         redirect_to root_path
      else
        redirect_to root_path
      end
    else
      render :edit
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    redirect_if_job_complete?
    @job.destroy
    redirect_to root_path
  end

  def add_machines
    @job = Job.find(params[:id])
  end

  def assign_machines
    @job = Job.find(params[:id])
  end

  def kickoff
    @job = Job.find(params[:id])
    @job.kickoff!
    flash[:success] = "Job number #{@job.job_number} is now active."
    redirect_to root_path
  end

  def on_hold
    @job = Job.find(params[:id])
    @job.on_hold!
    flash[:success] = "Job number #{@job.job_number} is now on hold."
    redirect_to root_path
  end

  def activate
    @job = Job.find(params[:id])
    @job.active!
    flash[:success] = "Job number #{@job.job_number} is now active."
    redirect_to root_path
  end

  def complete
    @job = Job.find(params[:id])
    @job.complete!
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:customer_id, :job_number, :job_status, :machine_ids => [],
    boxes_attributes: [:material_weight, :location_id, :material_id], job_machines_attributes: [:step_number, :id])
  end

end
