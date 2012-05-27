class BoardListsController < ApplicationController
  unloadable

  def new
    @board_list = BoardList.new(params[:board_list])
    if request.post? && @board_list.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to :controller => "settings", :action => "plugin", :id => "redmine_boards"
    end
  end
  
  def create
    @board_list = BoardList.new(params[:board_list])
    if @board_list.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to :controller => "settings", :action => "plugin", :id => "redmine_boards"
    else
      render :action => :new
    end
  end

  def edit
    @board_list = BoardList.find(params[:id])
    if request.post? && @board_list.update_attributes(params[:board_list])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :controller => "settings", :action => "plugin", :id => "redmine_boards"
    end
  end

  def update
    @board_list = BoardList.find(params[:id])
    if @board_list.update_attributes(params[:board_list])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :controller => "settings", :action => "plugin", :id => "redmine_boards"
    else
      render :action => :edit
    end
  end

  def destroy
    board_list = BoardList.find(params[:id])
    board_list.destroy
    redirect_to :controller => "settings", :action => "plugin", :id => "redmine_boards"
  end
end
