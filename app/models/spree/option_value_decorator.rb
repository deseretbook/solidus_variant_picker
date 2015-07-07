Spree::OptionValue.class_eval do

  scope :for_product, ->(product){
    joins(:variants).where('spree_variants.product_id' => product.try(:id)).uniq
  }

end
