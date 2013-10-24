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
    	@stories = Story.all
	end

	private

	def set_project
      @project = Project.find(params[:id])
    end

	def project_params
		params.required(:project).permit(:name)
	end
end
