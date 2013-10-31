class CriteriaController < ApplicationController
  before_action :set_story
  before_action :set_project
  
  def new
    @criterium = Criterium.new
  end

  def edit
  end

  def create
    @criterium = Criterium.new(criterium_params)

    if @criterium.save
      redirect_to project_story_path(@project, @story), notice: 'Acceptance criteria successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @criterium.update(criterium_params)
      redirect_to project_story_path(@project, @story), notice: 'Acceptance criteria successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
  def criterium_params
    params.require(:criterium).permit(:story_id, :details, :solved)
  end
  def set_story
      @story = Story.find(params[:criterium][:story_id])
      puts "---------"
      puts @story.project_id
    end

    def set_project
      @project = Project.find(Story.find(params[:criterium][:story_id]).project_id)
    end
end
