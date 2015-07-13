Spree::Admin::VariantsController.class_eval do

  protected

  def collection
    @deleted = (params.key?(:deleted) && params[:deleted] == "on") ? "checked" : ""

    if @deleted.blank?
      @collection ||= parent.variants_including_master
    else
      @collection ||= Spree::Variant.only_deleted.where(:product_id => parent.id)
    end
    @collection
  end

  def find_resource
    if parent_data.present?
      parent.variants_including_master.find(params[:id])
    else
      model_class.find(params[:id])
    end
  end

end
