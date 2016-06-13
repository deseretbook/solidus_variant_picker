
require 'spec_helper'

describe 'Variants', type: :feature, js: true do
  stub_authorization!

  let(:product) { create(:base_product) }
  let!(:master_variant) { create(:master_variant, product: product) }
  let!(:variant) { create(:variant, product: product) }
  let(:variant_to_delete) { create(:variant, product: product) }

  it 'should show master variant sku on product page' do
    visit spree.admin_product_path(product)
    click_link 'Variants'
    expect(page).to have_text(master_variant.sku)
  end

  it 'should show deleted variants' do
    variant_to_delete.destroy
    visit spree.admin_product_variants_path(product, deleted: 'on')
    expect(page).to have_text(variant_to_delete.sku)
  end

  it 'should go to master variant edit page' do
    visit spree.edit_admin_product_variant_path(product, master_variant)
    expect(page).to have_text('WEIGHT') # weight only shows on variant edit page
  end
end
