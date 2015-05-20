Spree::Admin::ProductsController.class_eval do

  def stock
    @variants = @product.variants_including_master
    @stock_locations = Spree::StockLocation.accessible_by(current_ability, :read)
    if @stock_locations.empty?
      flash[:error] = Spree.t(:stock_management_requires_a_stock_location)
      redirect_to admin_stock_locations_path
    end
  end

end
