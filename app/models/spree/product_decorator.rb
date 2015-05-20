Spree::Product.class_eval do

  def variants_including_master_and_option_values(current_currency = nil)
    variants_including_master.order('position asc').includes(:option_values).active(current_currency).select do |variant|
      variant.option_values.any?
    end
  end

  def multiple_variants?
    self.variants_including_master_and_option_values.count > 1
  end

  def first_option_type
    self.option_types.first
  end

end
