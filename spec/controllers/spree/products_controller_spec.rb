require 'spec_helper'

describe Spree::ProductsController, type: :controller do

  let!(:product) { create(:product) }
  let!(:variant) { create(:master_variant, product: product) }

  it 'should assign @variant_id if variant_id param is present' do
    spree_get :show, id: product.to_param, variant_id: variant.id
    expect(assigns['variant_id'].to_i).to eq(variant.id)
  end

end
