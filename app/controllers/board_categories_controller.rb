class BoardCategoriesController < ApplicationController
  unloadable

  def index
    @list = BoardList.find(params[:bl])
    @categories = @list.board_categories
  end

  def new
    @board_category = BoardCategory.new(:board_list_id => params[:bl])
  end

  def create
    @board_category = BoardCategory.new(params[:board_category])
    if @board_category.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to :controller => "board_categories", :action => "index", :bl => @board_category.board_list_id
    else
      render :action => :new
    end
  end

  def edit
    @board_category = BoardCategory.find(params[:id])
  end

  def update
    @board_category = BoardCategory.find(params[:id])
    if @board_category.update_attributes(params[:board_category])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :controller => "board_categories", :action => "index", :bl => @board_category.board_list_id
    else
      render :action => :edit
    end
  end

  def destroy
    board_category = BoardCategory.find(params[:id])
    board_list_id = board_category.board_list_id
    board_category.destroy
    redirect_to :controller => "board_categories", :action => "index", :bl => board_list_id
  end
end
