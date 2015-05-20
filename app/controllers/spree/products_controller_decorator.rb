Spree::ProductsController.class_eval do

  before_filter :get_variant_param, only: [:show]

  def get_variant_param
    logger.debug '*' * 80
    @variant_id = params[:variant_id] || nil
  end

end
