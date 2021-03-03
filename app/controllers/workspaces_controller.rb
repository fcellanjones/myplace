class WorkspacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @workspaces = Workspace.all
    if params.dig(:index_search, :search_city).present? && params.dig(:index_search, :search_distance).present?
      @workspaces = @workspaces.near(params.dig(:index_search, :search_city), params.dig(:index_search, :search_distance), units: :km)
      if @workspaces.empty?
        @workspaces = Workspace.search_by_location(params.dig(:index_search, :search_city))
      end
    end

    amenities = params.dig(:index_search, :amenities)&.reject { |amenity| amenity.blank? }
    if amenities && amenities.length > 0
      @workspaces = @workspaces.joins(workspace_amenities: :amenity).where(workspace_amenities: { amenities: { name: amenities } })
    end

    @markers = @workspaces.geocoded.map do |workspace|
      {
        lat: workspace.latitude,
        lng: workspace.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { workspace: workspace })
      }
    end
  end

  def show
    @workspace = Workspace.find(params[:id])
    @marker = [{
        lat: @workspace.latitude,
        lng: @workspace.longitude
      }]
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.create(strong_params)
    @workspace.user = current_user
    if @workspace.save
      flash[:notice] = "#{@workspace.name} has been created!"
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
    params.require(:workspace).permit(:name, :description, :capacity, :price, :first_line_address, :city, :postcode, photos: [], amenity_ids: [])
  end
end
