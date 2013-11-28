class StoriesController < ApplicationController
  authorize_resource unless Settings.auth.bypass_all 
  
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def index
    @iteration = @project.iterations.current.stories
  end

  def new
    @story = Story.new(iteration_id: params[:iteration_id])
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id

    puts "========= seting iteration id to: " + @project.iterations.icebox.id.to_s
    @story.iteration_id = @project.iterations.icebox.id 
    if !params[:story][:iteration_id].blank?
      puts "========= seting iteration id to: " + params[:story][:iteration_id].to_s
      @story.iteration_id = params[:story][:iteration_id]
    end

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
    @stories = @project.iterations.current.stories
  end

  def icebox
    @project = Project.find(params[:project_id])
    @stories = @project.iterations.icebox.stories
  end

  def addtoiteration
    @story = Story.find(params[:id])
    @story.iteration_id = @project.iterations.current.id
    @story.position = 0
    @story.save
    @iteration = @story.iteration #save this to recalculate totals
  end

  def removefromiteration
    @story = Story.find(params[:id])
    @iteration = @story.iteration #save this to recalculate totals
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
      params.require(:story).permit(:goal, :stakeholder, :behavior, :business_value, :complexity_value, :status_id, :project_id, :tag_list, :position, :iteration_id, :notes, :user_id, :include_in_current_iteration)
    end
end
