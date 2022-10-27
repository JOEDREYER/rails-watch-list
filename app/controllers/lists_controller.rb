class ListsController < ApplicationController
  
  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end



  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    # No need for app/views/bookmarks/destroy.html.erb
    redirect_to lists_path, status: :see_other
  end


  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end


end
