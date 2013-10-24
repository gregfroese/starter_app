class ProjectsController < ApplicationController
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

	private

	def project_params
		params.required(:project).permit(:name)
	end
end
