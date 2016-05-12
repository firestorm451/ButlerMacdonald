class MachinesController < ApplicationController
  before_action :require_user

  def index
    @machines = Machine.all.order("step_number DESC")
    @machines = Machine.order("name DESC")
  end

  def new
    @machine = Machine.new
    @job = Job.find(params[:job_id])
    @machines = @job.machines.order("step_number DESC")
  end

  def create
    @job = Job.find(params[:job_id])
    @machine = @job.machines.new(machine_params)
    if @machine.save
      redirect_to new_machine_path
    else
      render :new
    end
  end

  def edit
  end

  def update
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
