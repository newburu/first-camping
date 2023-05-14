class ImagesController < ApplicationController
  before_action :set_object

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @object.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @object.save
    redirect_back(fallback_location: root_path)
  end

  private

  def set_object
    @object = CampSite.find(params[:camp_site_id]) if params[:camp_site_id].present?
  end

  def add_more_images(new_images)
    images = @object.images 
    images += new_images
    @object.images = images
  end

  def remove_image_at_index(index)
    remain_images = @object.images
    if index == 0 && @object.images.size == 1
      @object.remove_images!
    else
      deleted_image = remain_images.delete_at(index) 
      deleted_image.try(:remove!)
      @object.images = remain_images
    end
  end

  def images_params
    params.require(:report).permit({images: []}) # allow nested params as array
  end
end