class PhotosController < ApplicationController
  http_basic_authenticate_with name: 'x', password: 'x', except: [:index, :show]
    
  def new
    @photo = Photo.new
  end
  
  def create
    @post = Photo.new(allowed_params)
      
    if @post.save
      flash[:success] = "Zdjęcie dodane"
      redirect_to photos_path
    else
      flash[:alert] = "Nie udało się dodać zdjęcia"
      render 'new'
    end
  end
  
  def index
    @photos = Photo.all
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  private
  
  def allowed_params
    params.require(:photo).permit(:photo)
  end

end
