module ProjectsHelper

	def hide_project_list_link
		@hide_project_list_link = true
	end

	def show_project_list_link?
		!@hide_project_list_link
	end

end
