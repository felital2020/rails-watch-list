class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end


  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      # binding.pry
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   @bookmark.update(bookmark_params)
  #   @bookmark.save!
  #   redirect_to bookmark_path(@bookmark)
  # end

  def destroy
    # @list = List.find(params[:list_id])
    # @bookmark.destroy
    # redirect_to @list, status: :see_other
    # @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find (params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
