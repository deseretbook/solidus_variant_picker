Spree::Variant.class_eval do
  # Sorts by option value position and other criteria after variant position.
  scope :order_by_option_value, ->{
    left_outer_joins(:option_values)
    .unscope(:order).order(
      position: :asc
    ).order(
      'spree_option_values.position ASC'
    ).order(
      is_master: :desc,
      id: :asc
    )
  }

  # Returns this variant's option value for its product's first option type.
  def first_option_value
    option_values.where(option_type_id: product.first_option_type.try(:id)).order(position: :asc).first
  end

  # Returns all option value delivery messages, if present, as a single String.
  # Returns nil if no option values have a delivery message.
  def option_delivery_messages
    dmsg = option_values.map{ |ov|
      msg = ov.delivery_message
      msg.present? ? h(msg) : nil
    }.compact.uniq.join('. ').html_safe

    dmsg.present? ? dmsg : nil
  end

  def stock_message
    if !in_stock?
      if is_backorderable?
        "#{Spree.t(:temporarily_out_of_stock)}. #{Spree.t(:deliver_when_available)}."
      else
        "#{Spree.t(:out_of_stock)}."
      end
    end
  end
end
