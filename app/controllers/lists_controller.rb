class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    # @list = List.new(list_params)
    # @list.save!
    # redirect_to list_path(@list)
    @list = List.new(list_params)
    # @list.save!
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    @list.save!
    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private


  def set_list
    @list = List.find (params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
