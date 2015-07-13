require 'spec_helper'

describe Spree::Admin::ProductsController, type: :controller do
  stub_authorization!

  let!(:product) { create(:product) }
  let!(:master_variant) { create(:master_variant, product: product) }

  it 'should assign @variant_id if variant_id param is present' do
    spree_get :stock, id: product.to_param
    expect(assigns[:variants]).to include(master_variant)
  end

  it 'should redirect and show an error if no stock_locations' do
    Spree::StockLocation.destroy_all
    spree_get :stock, id: product.to_param
    expect(flash[:error]).to match(/Please create a stock location/)
  end

end
