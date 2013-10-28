class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def new
    @story = Story.new
  end

  def edit
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to @project, notice: 'Story was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @project, notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def current
    project = Project.find(params[:project_id])
    @stories = project.iterations.last.stories
  end

  def icebox
    project = Project.find(params[:project_id])
    @stories = project.stories - project.iterations.last.stories
  end

  def addtoiteration
    @story = Story.find(params[:id])
    @story.iteration_id = @project.iterations.last.id
    @story.save
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def story_params
      params.require(:story).permit(:goal, :stakeholder, :behavior, :business_value, :complexity_value, :status_id, :project_id, :tag_list, :position)
    end
end
