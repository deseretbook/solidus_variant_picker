
class AddDeliveryMessageToSpreeOptionValues < ActiveRecord::Migration
  def change
    add_column :spree_option_values, :delivery_message, :string
  end
end
