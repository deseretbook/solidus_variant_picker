Spree::ProductsController.class_eval do
  prepend Spree::ProductsController::VariantSort
  before_action :get_variant_param, only: [:show]

  private

  def get_variant_param
    @variant_id = params[:variant_id] || nil
  end
end
