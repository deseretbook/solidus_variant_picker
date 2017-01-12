module Spree::ProductsController::VariantSort
  def show
    super
    @variants = @variants.order_by_option_value
  end
end
