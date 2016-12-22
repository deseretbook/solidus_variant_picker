class AddDeliveryMessageToSpreeOptionValues < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_option_values, :delivery_message, :string
  end
end
