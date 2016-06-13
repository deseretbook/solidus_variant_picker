
Spree::ProductsController.class_eval do
  before_action :get_variant_param, only: [:show]

  # Overrides Spree's default show method to order @variants by a different criteria
  def show_with_variant_sort
    show_without_variant_sort
    @variants = @variants.order_by_option_value
  end
  alias_method_chain :show, :variant_sort

  private

  def get_variant_param
    @variant_id = params[:variant_id] || nil
  end
end
