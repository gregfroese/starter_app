class ProjectsController < ApplicationController
	before_action :set_project, :only => [:show]

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.save!
		redirect_to projects_url
	end

	def show
    @iteration = @project.iterations.last.stories
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

	private

	def set_project
      @project = Project.find(params[:id])
    end

	def project_params
		params.required(:project).permit(:name)
	end
	
end
