class WorkspacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @workspaces = Workspace.all

    @markers = @workspaces.geocoded.map do |workspace|
      {
        lat: workspace.latitude,
        lng: workspace.longitude
      }
    end
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.create(strong_params)
    @workspace.user = current_user
    if @workspace.save
      redirect_to workspace_path(@workspace)
    else
      render :new
    end
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def update
    @workspace = Workspace.find(params[:id])
    if @workspace.update(strong_params)
      redirect_to workspace_path(@workspace)
    else
      render :edit
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy
    redirect_to workspaces_path
  end

  private

  def strong_params
    params.require(:workspace).permit(:name, :first_address_line, :postcode, :city, :amenities, :capacity, :prices, :description, amenity_ids: [], photos: [])
  end
end
