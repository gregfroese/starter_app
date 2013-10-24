class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def new
    @story = Story.new(:project_id => params[:project_id])
  end

  def edit
    puts "HERE I AM"
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @story.update(story_params)
      puts story_params
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:goal, :stakeholder, :behavior, :business_value, :complexity_value, :status_id)
    end
end
