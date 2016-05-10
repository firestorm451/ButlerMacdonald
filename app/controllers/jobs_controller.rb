class JobsController < ApplicationController

  def new
    @job = Job.new
    @job.job_machines.build
    @job.boxes.build
  end

  def index
    @job = Job.new
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    Rails.logger.info @job.boxes.inspect
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to job_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
      render :edit
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  def add_machines
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to assign_machines_job_path(@job)
    else
      render :new
    end
  end

  def assign_machines
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:customer_id, :job_number, :machine_ids => [],
    boxes_attributes: [:material_weight, :location_id, :material_id], job_machines_attributes: [:step_number, :id])
  end
end
