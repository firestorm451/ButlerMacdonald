class JobMachinesController < ApplicationController

  def show
    @job_machine = JobMachine.find(params[:id])
    @box = Box.new(:material_id => params[:material_id], :location_id => params[:location_id])
    @boxes = Box.all.order("location DESC")
  end
end
