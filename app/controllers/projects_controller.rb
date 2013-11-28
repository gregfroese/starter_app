class ProjectsController < ApplicationController
  authorize_resource unless Settings.auth.bypass_all
  before_action :set_project, :only => [:show, :resetsortorder, :manage, :stories_per_iteration]

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
    @project.user = current_user
		@project.save!
    iteration = Iteration.create(project: @project, current: true, name: "Default")
		redirect_to projects_url

	end

	def show
    @iteration = @project.iterations.current.stories
    @icebox = @project.stories - @iteration
	end

	def sortorder
		# project = Project.find(params["project_id"])
    @business_value = 0
    @complexity_value = 0

    iteration_id = params[:iteration_id]
		position = 1
		params["story"].each do |id|
			story = Story.find id
			story.position = position
      story.iteration_id = iteration_id
			story.save
			position = position + 1
      @business_value += story.business_value
      @complexity_value += story.complexity_value
		end
		render :nothing => true
	end

  def resetsortorder
    stories = Story.storiesInIterationByPriority params[:iteration_id]
    position = 1

    stories.each do |story|
      story.position = position
      story.save
      position = position + 1
    end

    redirect_to params[:redirect], notice: 'Stories successfully sorted.'

  end	

  def manage
  	@iteration = @project.iterations.current.stories
    @icebox = @project.stories.icebox
  end

  def stories_per_iteration
    if params[:iteration_id] != "0"
      @iteration = Iteration.find params[:iteration_id]
      @stories = @iteration.stories
    else
      @iteration = Iteration.new(id: 0, name: "Icebox")
      @stories = @project.stories.icebox
    end

    @total_values = calculate_total_values @stories
  end

	private

	def set_project
      @project = Project.find(params[:id])
    end

	def project_params
		params.required(:project).permit(:name, :user_id)
	end

  def calculate_total_values stories
    business_value = 0
    complexity_value = 0

    stories.each do |story|
      business_value += story.business_value
      complexity_value += story.complexity_value
    end

    [business_value: business_value, complexity_value: complexity_value]
  end

	
end
