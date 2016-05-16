class JobMachinesController < ApplicationController
  before_action :require_user

  def index
  end

  def show
    @job_machine = JobMachine.find(params[:id])
    @box = Box.new
  end
end
