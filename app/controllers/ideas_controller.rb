class IdeasController < ApplicationController
  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "You created a new idea successfully!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    @idea = Idea.find_by(params[:idea_id])
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :image, :category_id)
  end
end