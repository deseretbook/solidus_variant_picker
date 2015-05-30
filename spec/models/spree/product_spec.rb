require 'spec_helper'

describe Spree::Product, type: :model do

  context 'variants_including_master_and_option_values' do

    it 'returns only variants with option values' do
      product = create(:product_with_option_types)
      create(:base_variant, product: product) # this has option values
      create(:base_variant, product: product, option_values: [])
      
      expect(product.variants_including_master_and_option_values.size).to eq(1)
    end

  end

  context 'multiple_variants?' do

    it 'returns true if multiple variants with option values' do
      product = create(:product_with_option_types)
      create(:base_variant, product: product)
      create(:base_variant, product: product)

      expect(product.multiple_variants?).to eq(true)
    end

    it 'returns false if one variant with option values' do
      product = create(:product_with_option_types)
      create(:base_variant, product: product)

      expect(product.multiple_variants?).to eq(false)
    end

    it 'returns false if no variants with option values' do
      product = create(:product_with_option_types)

      expect(product.multiple_variants?).to eq(false)
    end

  end

  context 'first_option_type' do

    it 'returns the first option type' do
      product = create(:product)
      product.option_types << create(:option_type, name: 'Size of something')

      expect(product.first_option_type.name).to eq('Size of something')
    end

  end

end
