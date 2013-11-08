class StoriesController < ApplicationController
  authorize_resource unless Settings.auth.bypass_all 
  
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def index
    @iteration = @project.iterations.last.stories
  end

  def new
    @story = Story.new(iteration_id: params[:iteration_id])
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id

    if @story.save
      redirect_to project_story_path(@project, @story), notice: 'Story was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @story.update(story_params)
      redirect_to project_story_path(@project, @story), notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def current
    @project = Project.find(params[:project_id])
    @stories = @project.iterations.last.stories
  end

  def icebox
    @project = Project.find(params[:project_id])
    @stories = @project.stories - @project.iterations.last.stories
  end

  def addtoiteration
    @story = Story.find(params[:id])
    @story.iteration_id = @project.iterations.last.id
    @story.position = 0
    @story.save
  end

  def removefromiteration
    @story = Story.find(params[:id])
    @story.iteration_id = 0
    @story.position = 0
    @story.save
  end

  def adduser
    @story = Story.find(params[:id])
    @user = User.find(params[:user_id])
    if !@story.users.include? @user
      @story.users << @user
    end
    @project = @story.project
  end

  def removeuser
    @story = Story.find(params[:id])
    @user = User.find(params[:user_id])
    @story.users.delete(@user)
    @project = @story.project
  end

  private
    def set_story
      if params[:id]
        @story = Story.find(params[:id])
      end
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def story_params
      params.require(:story).permit(:goal, :stakeholder, :behavior, :business_value, :complexity_value, :status_id, :project_id, :tag_list, :position, :iteration_id, :notes, :user_id)
    end
end
