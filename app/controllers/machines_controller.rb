class MachinesController < ApplicationController

  def index
    @machines = Machine.all
  end

  def new
    @machine = Machine.new
    @job = Job.find(params[:job_id])
    @machines = @job.machines.order("step_number DESC")
  end

  def show
    @machine = Machine.find(params[:id])
    @jobs = @machine.jobs.where(job_status: "active").order("job_number")
  end

  def create
    if params[:job_id]
      @job = Job.find(params[:job_id])
      @machine = @job.machines.new(machine_params)
    else
      @machine = Machine.new(machine_params)
    end
    if @machine.save
      redirect_to new_machine_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @machine = Machine.find(params[:id])
    @machine.attributes = machine_params
    if @machine.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def machine_params
    params.require(:machine).permit(:name)
  end
end
