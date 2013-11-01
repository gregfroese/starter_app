class CriteriaController < ApplicationController
  before_action :set_story, only: [:new, :edit, :create]
  before_action :set_project, only: [:new, :edit, :create]
  
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
    @criterium = Criterium.find(params[:id])
    @criterium.update(criterium_params)
  end

  private
  def criterium_params
    params.require(:criterium).permit(:story_id, :details, :dev_test, :functional_test)
  end

  def set_story
    @story = Story.find(params[:criterium][:story_id])
  end

  def set_project
    @project = Project.find(Story.find(params[:criterium][:story_id]).project_id)
  end
end
