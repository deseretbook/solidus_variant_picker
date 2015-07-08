Spree::Variant.class_eval do

  # Sorts by option value position and other criteria after variant position.
  scope :order_by_option_value, ->{
    includes(:option_values).references(:option_values).unscope(:order).order(
      position: :asc
    ).order(
      'spree_option_values.position ASC'
    ).order(
      is_master: :desc,
      id: :asc
    ).uniq
  }


  def first_option_value
    self.option_values.where(option_type_id: self.product.first_option_type.id).order(position: :asc).first
  end

  def stock_message
    if !self.in_stock?
      if self.is_backorderable?
        "#{Spree.t(:temporarily_out_of_stock)}. #{Spree.t(:deliver_when_available)}."
      else
        "#{Spree.t(:out_of_stock)}."
      end
    else
      nil
    end
  end

end
