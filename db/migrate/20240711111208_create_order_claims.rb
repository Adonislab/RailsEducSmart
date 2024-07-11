class CreateOrderClaims < ActiveRecord::Migration[7.2]
  def change
    create_table :order_claims do |t|
      t.string :claim_type
      t.text :description
      t.string :status, default: 'pending'
      t.timestamps
    end
  end
end
