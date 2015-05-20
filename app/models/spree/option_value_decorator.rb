Spree::OptionValue.class_eval do

  scope :for_product, lambda { |product| select("DISTINCT #{table_name}.*").where("spree_option_values_variants.variant_id IN (?)", product.variants_including_master.map(&:id)).joins(:variants) }

end
