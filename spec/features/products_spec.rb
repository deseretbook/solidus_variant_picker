require 'spec_helper'

describe 'Variants Picker Form', type: :feature do

  context 'multiple variables' do

    let!(:first_option_type) { create(:option_type, presentation: 'First Option Type') }
    let!(:second_option_type) { create(:option_type, presentation: 'Second Option Type') }

    let!(:product) { create(:product, option_types: [first_option_type, second_option_type]) }

    let!(:first_variant) { create(:variant, option_values: [create(:option_value, name: 'First Value', option_type: first_option_type)], product: product) }
    let!(:second_variant) { create(:variant, option_values: [create(:option_value, name: 'Second Value', option_type: first_option_type)], product: product) }

    it 'should show presentation for first option type of product' do
      visit spree.product_path(id: product.slug)
      expect(page).to have_text('Option Type')
    end

    # TODO: Evaluate and uncomment these tests
    # it 'should have a disabled input if one cant be supplied' do
    #   second_variant.stock_items.update_all(count_on_hand: 0, backorderable: false)
    #   visit spree.product_path(id: product.slug)
    #   expect(page).to have_field("variant_id_#{second_variant.id}", disabled: true)
    # end
    #
    # it 'should have values assigned to first option type but not to second option type' do
    #   create(:variant, product: product, option_values: [
    #     create(:option_value, presentation: 'Third Value', option_type: first_option_type),
    #     create(:option_value, presentation: 'Fourth Value', option_type: second_option_type)
    #   ])
    #
    #   visit spree.product_path(id: product.slug)
    #   expect(page).to have_text('Third Value')
    #   expect(page).to_not have_text('Fourth Value')
    # end

  end

end
