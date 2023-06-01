class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build # build a new bookmark record associated with the list, don't need to use NEW
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to @bookmark.list, notice: 'Bookmark deleted', status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
