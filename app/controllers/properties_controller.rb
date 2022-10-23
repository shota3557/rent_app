class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    @near_stations = property.near_stations
  end

  def new
    @property = Property.new
    2.times { @property.near_stations.build }
  end

  def edit
    @property = Property.find(params[:id])
    @property.near_stations.build
  end

  def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to properties_path, notice: "物件を登録しました"
      else
        render :new  
      end
    end  
  end

  def confirm
    @property = Property.new(property_params)
    render :new if @property.invalid?
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to properties_path, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path, notice: "物件を削除しました"
  end

  private
  def property_params
    params.require(:property).permit(:name, :rent, :address, :year, :remarks, 
      near_stations_attributes: [:train_name, :station_name, :walking_time, :property_id, :id, :_destroy])
  end
end