class IterationsController < ApplicationController
  authorize_resource unless Settings.auth.bypass_all 
  def index
    @project = Project.find(params[:project_id])
    @iterations = Iteration.all
  end

  def set_current
    @project = Project.find(params[:project_id])
    @iteration = Iteration.find(params[:id])

    @iteration.set_current @project
    redirect_to project_iterations_path(@project)
  end

  def new
    @project = Project.find(params[:project_id])
    @iteration = Iteration.new(project_id: @project.id)
  end

  def create
    @project = Project.find(params[:project_id])
    @iteration = Iteration.new(iteration_params)
    @iteration.project = @project

    if @iteration.save
      redirect_to project_iterations_path(@project), notice: 'Iteration was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @project = Project.find(params[:project_id])
    if params[:id] != "0"
      @iteration = Iteration.find(params[:id])
    else
      @iteration = nil
    end
  end

  private
    def iteration_params
      params.require(:iteration).permit(:name, :start_date, :end_date, :project_id)
    end
end
