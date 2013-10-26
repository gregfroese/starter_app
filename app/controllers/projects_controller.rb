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
    @stories = @project.stories
	end

	def sortorder
		puts params
		position = 1
		params["story"].each do |id|
			story = Story.find(id)
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
