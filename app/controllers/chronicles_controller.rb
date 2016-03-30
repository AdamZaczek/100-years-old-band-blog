class ChroniclesController < ApplicationController
  before_action :find_chronicle, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: 'x', password: 'x', except: [:index, :show]
  
  def new
    @chronicle = Chronicle.new
  end
  
  def create
    @chronicle = Chronicle.new(allowed_params)
      
    if @chronicle.save
      flash[:success] = "Wpis utworzony"
      redirect_to chronicles_path
    else
      flash[:alert] = "Wpis nie został utworzony"
      render 'new'
    end
  end
  
  def show
  end
  
  def index
    @chronicles = Chronicle.all
  end
  
  def edit
  end
  
  def admin
    @chronicles = Chronicles.all
  end
  
  def update
    if @chronicle.update_attributes(allowed_params)
      flash[:success] = "Wpis zedytowany"
      redirect_to chronicles_path
    else
      flash[:alert] = "Wpis nie został zedytowany"
      render 'new'
    end
  end
  
  def destroy
    @chronicle.destroy
      flash[:success] = "Wpis usunięty"
      redirect_to chronicles_admin_path
  end

private

  def find_chronicle
    @chronicle = Chronicle.find(params[:id])
  end

  def allowed_params
    params.require(:chronicle).permit(:title, :body, :image)
  end
end
