class ListsController < ApplicationController

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/:id
  def show
    @list = List.find(params[:id])
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :cover_image)
  end
end
