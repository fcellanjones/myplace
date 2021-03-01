class FavoritesController < ApplicationController
  def create
    @workspace = Workspace.find(params[:workspace_id])
    @favorite = Favorite.create(workspace: @workspace, user: current_user)
    redirect_to workspace_path(@workspace)
  end

  def destroy
    @workspace = Workspace.find(params[:workspace_id])
    @favorite = Favorite.where(workspace: @workspace, user: current_user).first
    @favorite.destroy
    redirect_to workspace_path(@workspace)
  end
end
