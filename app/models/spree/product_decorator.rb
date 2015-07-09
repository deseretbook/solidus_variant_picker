Spree::Product.class_eval do

  def first_option_type
    self.option_types.order(position: :asc).first
  end

  # Returns the presentation names of the product's option types as a sentence.
  def option_types_presentation
    self.option_types.order(position: :asc).pluck(:presentation).compact.map(&:pluralize).uniq.to_sentence
  end

end
