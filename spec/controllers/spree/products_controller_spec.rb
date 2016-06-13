require 'spec_helper'

describe Spree::ProductsController, type: :controller do

  let!(:product) { create(:product) }
  let!(:variant) { create(:master_variant, product: product) }

  it 'should assign @variant_id if variant_id param is present' do
    spree_get :show, id: product.to_param, variant_id: variant.id
    expect(assigns['variant_id'].to_i).to eq(variant.id)
  end

  describe '#show' do
    it 'returns only variants with option values' do
      product = create(:product_with_option_types)
      create(:base_variant, product: product) # this has option values
      create(:base_variant, product: product, option_values: [])

      spree_get :show, id: product.to_param
      expect(assigns['variants'].count).to eq(1)
    end
  end

end
