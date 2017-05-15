
Spree::Admin::VariantsController.class_eval do
  protected

  # Keep up to date with Solidus
  def collection
    @deleted = params.key?(:deleted) && params[:deleted] == "on" ? "checked" : ""

    if @deleted.blank?
      # We need to get variants
      @collection ||= parent.variants
    else
      @collection ||= Spree::Variant.only_deleted.where(product_id: parent.id)
    end

    params[:q] ||= {}

    # @search needs to be defined as this is passed to search_form_for
    @search = @collection.ransack(params[:q])
    @collection = @search.result.includes(variant_includes).page(params[:page]).per(Spree::Config[:admin_variants_per_page])
  end

  def find_resource
    if parent_data.present?
      parent.variants.find(params[:id])
    else
      model_class.find(params[:id])
    end
  end
end
