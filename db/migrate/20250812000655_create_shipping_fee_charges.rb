class CreateShippingFeeCharges < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_fee_charges do |t|

      t.timestamps
    end
  end
end
