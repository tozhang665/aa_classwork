class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.find_by(artist_id: params[:user_id])
    if @artworks
      render json: @artworks
    else
      render json: {error: "No artworks found"}, status: 418
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork
      render json: @artwork
    else
      render json: {error: "No artworks for that ID"}, status: 418
    end
  end

  def update
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork 
      @artwork.update(artwork_params)
      redirect_to artwork_url(@artwork)
    else
      render json: {error: "artwork with ID given does not exist"}, status: 418
    end
  end

  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork
      @artwork.destroy
      # redirect_to artworks_url
      render json: @artwork
    else
      render json: {error: "No artwork to delete there"}, status:418
    end
  end
  
  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
