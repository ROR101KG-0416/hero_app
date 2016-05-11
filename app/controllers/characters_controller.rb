class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find_by_id(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      # redirect to index action
      flash[:notice] = "Character was saved successfully"
      redirect_to characters_path 
    else
      flash.now[:error] = "There was a problem saving this Character"
      render :new
    end
  end

  def edit
    @character = Character.find_by_id(params[:id])
  end

  def update
    @character = Character.find_by_id(params[:id])

    if @character.update(character_params)
      # redirect to show action
      redirect_to character_path(@character), notice: "Character was updated successfully"
    else
      flash.now[:error] = "There was an issue updating this Character"
      render :edit
    end 
  end

  def destroy
    @character = Character.find_by_id(params[:id])
    @character.delete

    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:alias, :first_name, :last_name, :universe)
  end
end





