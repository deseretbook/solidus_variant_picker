require 'spec_helper'

describe Spree::Variant, type: :model do

  context 'first_option_value' do

    it 'returns first option value for first option type on product' do
      product = create(:base_product)
      first_type = create(:option_type, name: 'First Type')
      second_type = create(:option_type, name: 'Second Type')
      product.option_types << first_type
      product.option_types << second_type
      
      variant = create(:base_variant, { 
        product: product,
        option_values: [
          create(:option_value, name: 'First Value', option_type: first_type),
          create(:option_value, name: 'Second Value', option_type: second_type)
        ]
      })

      expect(variant.first_option_value.name).to eq('First Value')
      expect(variant.first_option_value.option_type.name).to eq('First Type')
    end

  end

  context 'stock_message' do

    it 'returns deliver when available if backorderable and none on hand' do
      product = create(:base_product)
      variant = create(:base_variant)

      expect(variant.stock_message).to match(/deliver_when_available/)
    end

    it 'returns deliver when available if backorderable and none on hand' do
      create(:stock_location, backorderable_default: false)
      product = create(:base_product)
      variant = create(:base_variant)

      expect(variant.stock_message).to match(/Out of Stock\./)
    end

  end

end
