Spree::ProductsController.class_eval do

  before_filter :get_variant_param, only: [:show]

  def get_variant_param
    @variant_id = params[:variant_id] || nil
  end

end
