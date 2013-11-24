class ProjectsController < ApplicationController
  authorize_resource unless Settings.auth.bypass_all
  before_action :set_project, :only => [:show, :resetsortorder, :manage]

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
		position = 1
		params["story"].each do |id|
			story = Story.find id
			story.position = position
			story.save
			position = position + 1
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

	private

	def set_project
      @project = Project.find(params[:id])
    end

	def project_params
		params.required(:project).permit(:name, :user_id)
	end
	
end
