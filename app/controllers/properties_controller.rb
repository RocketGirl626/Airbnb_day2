class PropertiesController < ApplicationController
  before_filter :authenticate_user!, except: [:index] 
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @user = current_user
    @property = @user.properties.new(property_params)
    if @property.save
      flash[:notice] = "Property saved!"
      redirect_to properties_path
    else
      render :new
    end
  end

  def show
     @property = Property.find(params[:id])
   end

  def edit
    @property = Property.find(params[:id])
  end

  def update
     @property = Property.find(params[:id])
     if @property.update(property_params)
       flash[:notice] = "Your property has been updated."
       redirect_to property_path(@property)
     else
       render :edit
     end
   end

   def destroy
     @property = Property.find(params[:id])
     @property.destroy
     flash[:notice] = "Your property has been deleted."
     redirect_to properties_path()
   end


private
  def property_params
    params.require(:property).permit(:name, :description)
  end

end
