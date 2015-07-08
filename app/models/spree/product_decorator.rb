Spree::Product.class_eval do

  def first_option_type
    self.option_types.order(position: :asc).first
  end

end
