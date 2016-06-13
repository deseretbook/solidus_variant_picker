
require 'spec_helper'

describe Spree::Product, type: :model do
  context 'first_option_type' do
    it 'returns the first option type' do
      product = create(:product)
      product.option_types << create(:option_type, name: 'Size of something')

      expect(product.first_option_type.name).to eq('Size of something')
    end
  end
end
