class CharactersController < ApplicationController
  before_action :find_character, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @characters = Character.search(params[:query])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @comment = Comment.new
    @comments = @character.comments
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
  end

  def update
    if @character.update(character_params)
      # redirect to show action
      redirect_to character_path(@character), notice: "Character was updated successfully"
    else
      flash.now[:error] = "There was an issue updating this Character"
      render :edit
    end 
  end

  def destroy
    @character.delete

    respond_to do |format|
      format.html { redirect_to characters_path, notice: 'something happened' }
      format.js
    end
  end

  private

  def find_character
    @character = Character.find_by_id(params[:id])
  end

  def character_params
    params.require(:character).permit(:alias, :first_name, :last_name, :universe_id, :bio, :photo, :ability_ids => [])
  end
end





